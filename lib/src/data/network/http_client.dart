import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:inlingua/src/data/store/app_store.dart';

class HTTPClient {
  static int REQUEST_TIMEOUT = 15;
  static int CONNECT_TIMEOUT = 5;

  final Duration _requestTimeout = Duration(seconds: REQUEST_TIMEOUT);

  final Duration _connectTimeout = Duration(seconds: CONNECT_TIMEOUT);
  Map<String, String> _headers = {'Content-type': 'application/json'};
  set headers(Map<String, String> headers) {
    _headers = headers;
  }

  Future<Map<String, dynamic>> postJSONRequest(
      {String url, Object data}) async {
    if (AppStore().getNetworkStatus()) {
      final String jsonRequest = json.encode(data);
      final String response = await postRequest(url: url, data: jsonRequest);
      return json.decode(response) as Map<String, dynamic>;
    } else {
      return {
        'is_error': true,
        'message': 'Unable to connect. Please Check Internet Connection'
      };
    }
  }

  Future<String> postRequest({String url, String data}) async {
    print('HTTPClient Request> $url body> $data');
    final HttpClient client = HttpClient();

    try {
      client.connectionTimeout = _connectTimeout;
      final HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');
      if (AppStore().getSessionCookie() != null)
        request.headers.set('Cookie', AppStore().getSessionCookie());
      request.write(data);
      final HttpClientResponse response =
          await request.close().timeout(_requestTimeout);
      storeCookie(response.headers);
      final String sResponse = await response.transform(utf8.decoder).join();
      print('HTTPClient Response> $sResponse');
      return sResponse;
    } catch (e) {
      Map error = {
        'is_error': true,
        'message': 'Unable to connect. Please Check Internet Connection'
      };
      return json.encode(error);
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> getJSONRequest({String url}) async {
    final String response = await getRequest(url: url);
    return json.decode(response) as Map<String, dynamic>;
  }

  Future<String> getRequest({String url}) async {
    final HttpClient client = HttpClient();

    try {
      client.connectionTimeout = _connectTimeout;
      final HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');
      if (AppStore().getSessionCookie() != null)
        request.headers.set('Cookie', AppStore().getSessionCookie());
      final HttpClientResponse response =
          await request.close().timeout(_requestTimeout);
      storeCookie(response.headers);
      final String sResponse = await response.transform(utf8.decoder).join();
      print('HTTPClient Response> $sResponse');
      return sResponse;
    } finally {
      client.close();
    }
  }

  void storeCookie(final HttpHeaders headers) {
    String output = '';
    headers.forEach(
      (String key, List<String> values) {
        if (key == 'set-cookie') {
          values.forEach(
            (String v) {
              output += ' ' + v.split(';').elementAt(0) + ';';
            },
          );
        }
      },
    );
    if (output.isEmpty) {
      return;
    }
    output = output.substring(0, output.length - 1);
    AppStore().setCookie(output);
  }
}

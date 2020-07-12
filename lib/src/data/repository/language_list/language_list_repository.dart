import 'package:flutter/material.dart';
import 'package:inlingua/src/constants/api_services_urls.dart';
import 'package:inlingua/src/data/network/http_client.dart';
import 'package:inlingua/src/models/language_list/language_list_response_mdoel.dart';

class LanguageListRepository {
  Future<LanguageListResponseModel> fetchList() async {
    final Map<String, dynamic> resp =
        await HTTPClient().getJSONRequest(url: ApiServiceUrls.languages);
    return LanguageListResponseModel.fromJson(resp);
  }
}

import 'package:inlingua/src/constants/api_services_urls.dart';
import 'package:inlingua/src/data/network/http_client.dart';
import 'package:inlingua/src/models/login/login_response_model.dart';

class LoginRepository {
  Future<LoginResponseModel> loginRequest(Map<String, dynamic> payload) async {
    final Map<String, dynamic> resp = await HTTPClient()
        .postJSONRequest(url: ApiServiceUrls.login, data: payload);
    return LoginResponseModel.fromJson(resp);
  }
}

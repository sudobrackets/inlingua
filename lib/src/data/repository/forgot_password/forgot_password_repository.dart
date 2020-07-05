import 'package:inlingua/src/constants/api_services_urls.dart';
import 'package:inlingua/src/data/network/http_client.dart';
import 'package:inlingua/src/models/forgot_password/forgot_password_response_model.dart';

class ForgotPasswordRepository {
  Future<ForgotPasswordResponseModel> forgotRequest(
      Map<String, dynamic> payload) async {
    final Map<String, dynamic> resp = await HTTPClient()
        .postJSONRequest(url: ApiServiceUrls.forgotPassword, data: payload);
    return ForgotPasswordResponseModel.fromJson(resp);
  }
}

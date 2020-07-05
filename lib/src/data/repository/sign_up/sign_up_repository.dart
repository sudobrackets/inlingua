import 'package:flutter/material.dart';
import 'package:inlingua/src/constants/api_services_urls.dart';
import 'package:inlingua/src/data/network/http_client.dart';
import 'package:inlingua/src/models/login/login_response_model.dart';
import 'package:inlingua/src/models/sign_up/sign_up_response_model.dart';

class SignUpRepository {
  Future<SignUpReponseModel> signUpRequest(Map<String, dynamic> payload) async {
    final Map<String, dynamic> resp = await HTTPClient()
        .postJSONRequest(url: ApiServiceUrls.signup, data: payload);
    return SignUpReponseModel.fromJson(resp);
  }
}

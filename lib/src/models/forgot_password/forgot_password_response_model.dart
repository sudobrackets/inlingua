import 'package:inlingua/src/models/base/base_model.dart';

class ForgotPasswordResponseModel extends BaseModel {
  dynamic userId;

  ForgotPasswordResponseModel({this.userId});

  ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {}
}

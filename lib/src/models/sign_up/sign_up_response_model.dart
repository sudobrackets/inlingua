import 'package:inlingua/src/models/base/base_model.dart';

class SignUpReponseModel extends BaseModel {
  dynamic userId;

  SignUpReponseModel({this.userId});

  SignUpReponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {}
}

import 'package:inlingua/src/models/base/base_model.dart';

class LoginResponseModel extends BaseModel {
  String userToken;
  String userId;
  String name;
  String email;
  String phoneNumber;
  String profileImage;

  LoginResponseModel(
      {this.userToken,
      this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.profileImage});

  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (data != null) {
      userToken = data['userToken'];
      userId = data['user_id'];
      name = data['name'];
      email = data['email'];
      phoneNumber = data['phone_number'];
      profileImage = data['profile_image'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userToken'] = this.userToken;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

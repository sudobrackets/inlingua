import 'package:inlingua/src/models/login/login_response_model.dart';

class AppStore {
  static final AppStore _appStore = AppStore._();
  factory AppStore() => _appStore;
  AppStore._() {}

  String _sessionCookie;
  LoginResponseModel _userDetails;
  bool _networkStatus = false;

  String getSessionCookie() {
    return _sessionCookie;
  }

  void setCookie(String cookie) {
    _sessionCookie = cookie;
  }

  void setUserDetails(LoginResponseModel userData) {
    _userDetails = userData;
  }

  LoginResponseModel getUserDetails() {
    return _userDetails;
  }

  void setNetworkStatus(bool status) {
    _networkStatus = status;
  }

  bool getNetworkStatus() {
    return _networkStatus;
  }
}

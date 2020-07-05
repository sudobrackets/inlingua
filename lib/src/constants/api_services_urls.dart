import 'package:inlingua/src/config/app_config.dart';

class ApiServiceUrls {
  static String baseURL = AppConfig.baseURL;
  static String signup = baseURL + 'signup';
  static String login = baseURL + 'login';
  static String forgotPassword = baseURL + 'forgot_password';
}

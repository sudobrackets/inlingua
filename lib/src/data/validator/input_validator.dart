import 'package:flutter/services.dart';

class InputValidator {
  static List<TextInputFormatter> username = <TextInputFormatter>[
    WhitelistingTextInputFormatter(RegExp('[A-Za-z0-9]')),
  ];
  static List<TextInputFormatter> password = <TextInputFormatter>[
    // DateFormatter()
  ];
  static List<TextInputFormatter> mobileNumberRegEx = <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
    // DateFormatter()
  ];
}

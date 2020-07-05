import 'package:flutter/material.dart';

class AppWidgetSize {
// FONT SIZE CONFIG

  static const double captionSize = 14;
  static const double headline6Size = 18;
  static const double headline5Size = 25;
  static const double headline4Size = 20;
  static const double headline3Size = 16;
  static const double headline2Size = 14;
  static const double headline1Size = 12;
  static const double subtitle1Size = 14;
  static const double bodyText2Size = 12;
  static const double bodyText1Size = 10;

  static const double inputSize = 16;
  static const double inputLabelSize = 16;
  static const double buttonTextSize = 17;

  static const double bigTextSize = 18;
  static const double textSize = 16;
  static const double smallTextSize = 13;

  static const double buttonHeight = 45;

  static BorderRadius buttonBorderRadius = BorderRadius.circular(7);
  static BorderRadius containerWrapRadius = BorderRadius.circular(24);

  static double safeAreaSpace = 0;

// SCREEN SIZE CONFIG

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return (screenSize(context).height - safeAreaSpace) / dividedBy;
  }

  static double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  static double fullWidth(BuildContext context) {
    return screenWidth(context, dividedBy: 1);
  }

  static double halfWidth(BuildContext context) {
    return screenWidth(context, dividedBy: 2);
  }

  static double fullHeight(BuildContext context) {
    return screenHeight(context, dividedBy: 1);
  }

  static double halfHeight(BuildContext context) {
    return screenHeight(context, dividedBy: 2);
  }

  static bool largeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static void setSafeAreaSpace(BuildContext context) {}
}

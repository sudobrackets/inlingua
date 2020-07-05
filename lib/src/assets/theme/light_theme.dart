//light_theme.dart
import 'package:flutter/material.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';

const Color APP_PRIMARY_COLOR = Color(0xFFfdbf41);
const Color APP_PRIMARY_LIGHT_COLOR = Color(0xFFF0B334);
const Color APP_PRIMARY_DARK_COLOR = Color(0xFFf0b234);
const Color APP_ACCENT_COLOR = Color(0xFF37C1AA);
const Color APP_BACKGROUND_COLOR = Color(0xFFFFFFFF);
const Color APP_SCAFFOLD_BACKGROUND_COLOR = APP_PRIMARY_DARK_COLOR;
const Color APP_BAR_BACKGROUND_COLOR = Color(0xFFFFFFFF);
const Color APP_BORDER_COLOR = Color(0xFF707070);
const Color APP_BUTTON_TEXT_COLOR = Color(0xFFFFFFFF);
const Color APP_TEXT_COLOR = Color(0xFF000000);
const Color APP_PRIMARY_TEXT_COLOR = Color(0xFF939fa2);
const Color APP_ACCENT_TEXT_COLOR = Color(0xFF04927B);
const Color APP_LIGHT_ACCENT_TEXT_COLOR = Color(0xFF636573);
const Color LABEL_COLOR = Color(0xFFAEB2B7);
const Color APP_INPUT_FILL_COLOR = Color(0xFFF1F1F1);
const Color SNACKBAR_BACKGROUND_COLOR = Color(0xFFDEDEDE);
const Color APP_OVERLINE_COLOR = APP_ACCENT_TEXT_COLOR;
const Color BLACK_COLOR = Color(0xFF1C1E30);
const Color APP_FOCUS_INPUT_BORDER_COLOR = Color(0xFFEAEBEC);
const Color APP_ICON_COLOR = Color(0xFF000000);
const Color APP_ACCENT_ICON_COLOR = Color(0xFF717880);
const Color APP_ERROR_COLOR = Color(0xFFD83831);

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: APP_PRIMARY_COLOR,
    primaryColorLight: APP_PRIMARY_LIGHT_COLOR,
    primaryColorDark: APP_PRIMARY_DARK_COLOR,
    accentColor: APP_ACCENT_COLOR,
    backgroundColor: APP_BACKGROUND_COLOR,
    scaffoldBackgroundColor: APP_SCAFFOLD_BACKGROUND_COLOR,
    fontFamily: 'Lato',
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      color: APP_SCAFFOLD_BACKGROUND_COLOR,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        fontSize: AppWidgetSize.headline6Size,
        fontWeight: FontWeight.w600,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      headline5: TextStyle(
        fontSize: AppWidgetSize.headline5Size,
        fontWeight: FontWeight.w600,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      headline4: TextStyle(
        fontSize: AppWidgetSize.headline4Size,
        fontWeight: FontWeight.w500,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      headline3: TextStyle(
        fontSize: AppWidgetSize.headline3Size,
        fontWeight: FontWeight.w400,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      headline2: TextStyle(
        fontSize: AppWidgetSize.headline2Size,
        fontWeight: FontWeight.w500,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      headline1: TextStyle(
        fontSize: AppWidgetSize.headline1Size,
        fontWeight: FontWeight.w500,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      subtitle1: TextStyle(
        fontSize: AppWidgetSize.subtitle1Size,
        fontWeight: FontWeight.w600,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        fontSize: AppWidgetSize.bodyText2Size,
        fontWeight: FontWeight.w400,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      bodyText1: TextStyle(
        fontSize: AppWidgetSize.bodyText1Size,
        fontWeight: FontWeight.w400,
        color: APP_PRIMARY_TEXT_COLOR,
      ),
      button: TextStyle(
        fontSize: AppWidgetSize.buttonTextSize,
        color: APP_BUTTON_TEXT_COLOR,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: AppWidgetSize.headline6Size,
        fontWeight: FontWeight.w600,
        color: APP_TEXT_COLOR,
      ),
      headline5: TextStyle(
        fontSize: AppWidgetSize.headline5Size,
        fontWeight: FontWeight.w600,
        color: APP_TEXT_COLOR,
      ),
      headline4: TextStyle(
        fontSize: AppWidgetSize.headline4Size,
        fontWeight: FontWeight.w500,
        color: APP_TEXT_COLOR,
      ),
      headline3: TextStyle(
        fontSize: AppWidgetSize.headline3Size,
        fontWeight: FontWeight.w400,
        color: APP_TEXT_COLOR,
      ),
      headline2: TextStyle(
        fontSize: AppWidgetSize.headline2Size,
        fontWeight: FontWeight.w500,
        color: APP_TEXT_COLOR,
      ),
      headline1: TextStyle(
        fontSize: AppWidgetSize.headline1Size,
        fontWeight: FontWeight.w500,
        color: APP_TEXT_COLOR,
      ),
      subtitle1: TextStyle(
        fontSize: AppWidgetSize.subtitle1Size,
        fontWeight: FontWeight.w600,
        color: APP_TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        fontSize: AppWidgetSize.bodyText2Size,
        fontWeight: FontWeight.w400,
        color: APP_TEXT_COLOR,
      ),
      bodyText1: TextStyle(
        fontSize: AppWidgetSize.bodyText1Size,
        fontWeight: FontWeight.w400,
        color: APP_TEXT_COLOR,
      ),
      button: TextStyle(
        fontSize: AppWidgetSize.buttonTextSize,
        color: APP_BUTTON_TEXT_COLOR,
        fontWeight: FontWeight.w600,
      ),
    ),
    accentTextTheme: TextTheme(
      headline6: TextStyle(
        fontSize: AppWidgetSize.headline6Size,
        fontWeight: FontWeight.w600,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      headline5: TextStyle(
        fontSize: AppWidgetSize.headline5Size,
        fontWeight: FontWeight.w600,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      headline4: TextStyle(
        fontSize: AppWidgetSize.headline4Size,
        fontWeight: FontWeight.w500,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      headline3: TextStyle(
        fontSize: AppWidgetSize.headline3Size,
        fontWeight: FontWeight.w400,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      headline2: TextStyle(
        fontSize: AppWidgetSize.headline2Size,
        fontWeight: FontWeight.w500,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      headline1: TextStyle(
        fontSize: AppWidgetSize.headline1Size,
        fontWeight: FontWeight.w500,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      subtitle1: TextStyle(
        fontSize: AppWidgetSize.subtitle1Size,
        fontWeight: FontWeight.w600,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        fontSize: AppWidgetSize.bodyText2Size,
        fontWeight: FontWeight.w400,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      bodyText1: TextStyle(
        fontSize: AppWidgetSize.bodyText1Size,
        fontWeight: FontWeight.w400,
        color: APP_ACCENT_TEXT_COLOR,
      ),
      button: TextStyle(
        fontSize: AppWidgetSize.buttonTextSize,
        color: APP_BUTTON_TEXT_COLOR,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: AppWidgetSize.inputLabelSize,
        color: APP_TEXT_COLOR,
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: AppWidgetSize.inputLabelSize,
        color: APP_TEXT_COLOR,
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: APP_ICON_COLOR,
      size: 32,
    ),
    iconTheme: const IconThemeData(
      color: APP_BACKGROUND_COLOR,
      size: 32,
    ),
    accentIconTheme: const IconThemeData(
      color: APP_PRIMARY_TEXT_COLOR,
      size: 32,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: APP_SCAFFOLD_BACKGROUND_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
  );
}

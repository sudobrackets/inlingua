//light_theme.dart
import 'package:flutter/material.dart';

const Color APP_PRIMARY_COLOR = Color(0xFFF2DB9B);
const Color APP_PRIMARY_LIGHT_COLOR = Color(0xFF282736);
const Color APP_ACCENT_COLOR = Color(0xFF171927);
const Color APP_BACKGROUND_COLOR = Color(0xFF1C1E30);
const Color APP_BAR_BACKGROUND_COLOR = Color(0xFF222337);
const Color APP_BORDER_COLOR = Color(0xFF707070);
const Color APP_TEXT_COLOR = Color(0xFFCBCBCB);
const Color APP_ACCENT_TEXT_COLOR = Color(0xFF9798A1);
const Color APP_LIGHT_ACCENT_TEXT_COLOR = Color(0xFF6B6D78);
const Color LABEL_COLOR = Color(0xFFAEB2B7);
const Color APP_INPUT_FILL_COLOR = Color(0xFF222337);
const Color SNACKBAR_BACKGROUND_COLOR = Color(0xFFDEDEDE);
const Color APP_OVERLINE_COLOR = Color(0xFFCBCBCB);
const Color WHITE_COLOR = Color(0xFFFFFFFF);
const Color APP_FOCUS_INPUT_BORDER_COLOR = Color(0xFF212335);
const Color APP_ICON_COLOR = Color(0xFFFFFFFF);
const Color APP_ACCENT_ICON_COLOR = Color(0xFF9798A1);
const Color APP_ERROR_COLOR = Color(0xFFF8646C);

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: APP_PRIMARY_COLOR,
    primaryColorLight: APP_PRIMARY_LIGHT_COLOR,
    accentColor: APP_ACCENT_COLOR,
    backgroundColor: APP_BACKGROUND_COLOR,
    scaffoldBackgroundColor: APP_BACKGROUND_COLOR,
    fontFamily: 'PTSansNarrow',
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  static Color getColor(BuildContext context, Color color) {
    return (color != null) ? color : Theme.of(context).iconTheme.color;
  }

  static SvgPicture getSVGImage(String url, BuildContext context,
      {Color color, dynamic width, dynamic height}) {
    return SvgPicture.asset(
      url,
      color: color != null ? getColor(context, color) : null,
      width: width,
      height: height,
    );
  }

  static DecorationImage loginBackground({double width, double height}) {
    return const DecorationImage(
      image: AssetImage('lib/src/assets/images/init_screen_background.jpg'),
      fit: BoxFit.contain,
    );
  }

  static DecorationImage appBackground({double width, double height}) {
    return const DecorationImage(
      image: AssetImage('lib/src/assets/images/app_bg.png'),
      fit: BoxFit.fill,
    );
  }

  static Image appBackgroundCover({double width, double height}) => Image(
        image: const AssetImage('lib/src/assets/images/app_bg.png'),
        fit: BoxFit.fill,
        width: width ?? 200,
        height: height ?? 51,
      );

  static Image logo({double width, double height}) => Image(
        image: const AssetImage('lib/src/assets/images/inlingua.png'),
        fit: BoxFit.cover,
        width: width ?? 200,
        height: height ?? 51,
      );

  static Image loader({double width, double height}) => Image(
        image: const AssetImage('lib/src/assets/images/loader.gif'),
        fit: BoxFit.cover,
        width: width,
        height: height,
      );

  static Image photo({double width, double height}) => Image(
        image: const AssetImage('lib/src/assets/images/photo.png'),
        fit: BoxFit.cover,
        width: width,
        height: height,
      );

  static SvgPicture virtualTrading(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/virtual_trading.svg',
        context,
        color: color,
        width: width,
        height: height,
      );

  static SvgPicture outline(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/outline.svg',
        context,
        color: color ?? Theme.of(context).iconTheme.color,
        width: width,
        height: height,
      );

  static SvgPicture group(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/group.svg',
        context,
        color: color ?? Theme.of(context).iconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture privateAccount(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/private_account.svg',
        context,
        color: color ?? Theme.of(context).iconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture playing(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/playing.svg',
        context,
        color: color ?? Theme.of(context).iconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture conversation(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/conversation.svg',
        context,
        color: color ?? Theme.of(context).iconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture calendar(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/calendar.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture babyChair(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/baby_chair.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture logout(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/logout.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture presentation(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/presentation.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture book(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/book.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture translation(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/translation.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
  static SvgPicture batch(BuildContext context,
          {Color color, double width, double height}) =>
      getSVGImage(
        'lib/src/assets/images/batch.svg',
        context,
        color: color ?? Theme.of(context).accentIconTheme.color,
        width: width,
        height: height,
      );
}

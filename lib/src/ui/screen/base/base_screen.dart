import 'package:flutter/material.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => null;
}

abstract class BaseScreenState<Page extends BaseScreen> extends State<Page> {
  bool _loaderStared = false;

  void stopLoader() {
    if (_loaderStared) {
      Navigator.of(context).pop();
      _loaderStared = false;
    }
  }

  void startLoader() {
    _loaderStared = true;

    showDialog<WillPopScope>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            alignment: Alignment.center,
            child: AppImages.loader(
              width: 50,
              height: 50,
            ),
          ),
        );
      },
    );
  }

  void showAlert(String message, {Function callBack}) {
    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.all(0),
          title: Container(
            padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppTextConstants.APP_NAME,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                  onPressed: _closeButtonPressed,
                )
              ],
            ),
          ),
          content: Container(
              padding: EdgeInsets.fromLTRB(16,16,16,30),
              width: AppWidgetSize.screenWidth(context, dividedBy: 1.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        message ?? '',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        margin: EdgeInsets.only(top: 30),
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () => _okayButtonPressed(callBack),
                          child: Text(
                            AppTextConstants.OKAY.toUpperCase(),
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).backgroundColor,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text(
              //       AppTextConstants.OKAY,
              //       style: Theme.of(context).textTheme.headline4,
              //     ),
              //     onPressed: _closeButtonPressed,
              //   )
              // ],
              ),
        );
      },
    );
  }

  void _closeButtonPressed() {
    Navigator.of(context).pop();
  }

  void _okayButtonPressed(dynamic callBack) {
    Navigator.of(context).pop();
    if (callBack != null) {
      callBack();
    }
  }

  Future<dynamic> showAlertWithNButtons(String message, List<Widget> actions) {
    return showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppTextConstants.APP_NAME),
          content: Container(
            child: Text(message),
          ),
          actions: actions,
        );
      },
    );
  }

  GestureDetector backButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(Icons.arrow_back_ios),
    );
  }

  void showAlertdismiss() {
    Navigator.of(context).pop();
  }
}

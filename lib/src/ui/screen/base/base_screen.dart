import 'package:flutter/material.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
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
          title: Text(
            AppTextConstants.APP_NAME,
            style: Theme.of(context).textTheme.headline5,
          ),
          content: Container(
            child: Text(
              message ?? '',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                AppTextConstants.OKAY,
                style: Theme.of(context).textTheme.headline4,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (callBack != null) {
                  callBack();
                }
              },
            )
          ],
        );
      },
    );
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

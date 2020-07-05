import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/constants/storage_constants.dart';
import 'package:inlingua/src/data/store/app_storage.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';

class InitScreen extends StatefulWidget {
  InitScreen({Key key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      dynamic userData = await AppStorage().getData(USER_DETAILS);
      if (userData != null) {
        Navigator.of(context)
            .pushReplacementNamed(ScreenRoutes.BATCHES_LIST_SCREEN);
      } else {
        Navigator.of(context).pushReplacementNamed(ScreenRoutes.LOGIN_SCREEN);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: AppImages.loginBackground()),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120),
                    child: AppImages.logo(),
                  ),
                  AppImages.loader(width: 40, height: 40),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

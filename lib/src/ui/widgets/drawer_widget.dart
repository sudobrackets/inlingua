import 'package:flutter/material.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/constants/storage_constants.dart';
import 'package:inlingua/src/data/store/app_storage.dart';
import 'package:inlingua/src/data/store/app_utils.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';

class DrawerWidget extends StatelessWidget {
  String name;
  DrawerWidget({this.name});
  @override
  Widget build(BuildContext context) {
    List sideMenuList = [
      {
        'icon': AppImages.batch(
          context,
          color: Theme.of(context).iconTheme.color,
        ),
        'label': AppTextConstants.BATCHES,
        'screen': ScreenRoutes.BATCHES_LIST_SCREEN
      },
      {
        'icon': AppImages.translation(
          context,
          color: Theme.of(context).iconTheme.color,
        ),
        'label': AppUtils().camelCase(AppTextConstants.CHOOSE_LANGUAGE),
        'screen': ScreenRoutes.LANGUAGE_LIST
      },
      {
        'icon': AppImages.book(
          context,
          color: Theme.of(context).iconTheme.color,
        ),
        'label': AppTextConstants.LIBRARY,
        'screen': ScreenRoutes.BATCHES_LIST_SCREEN
      },
      {
        'icon': AppImages.presentation(
          context,
          color: Theme.of(context).iconTheme.color,
        ),
        'label': AppTextConstants.MY_CLASSES,
        'screen': ScreenRoutes.LANGUAGE_LIST
      }
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
          color: Theme.of(context).accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                    ),
                    AppImages.logo(
                      width: 150,
                      height: 38,
                    ),
                    Container()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 64, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    sideMenuList.length,
                    (int index) {
                      Map sideMenuItem = sideMenuList[index];
                      return GestureDetector(
                        onTap: () =>
                            menuNavigation(context, sideMenuItem['screen']),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            children: <Widget>[
                              sideMenuItem['icon'],
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                  sideMenuItem['label'],
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 75, top: 40),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 0.5, color: Theme.of(context).iconTheme.color),
                  ),
                ),
                child: GestureDetector(
                  onTap: () => _logoutButtonPressed(context),
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      AppImages.logout(
                        context,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          AppTextConstants.LOG_OUT,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Theme.of(context).iconTheme.color,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void menuNavigation(BuildContext context, String screen) {
    if (name != screen) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(screen);
    }
  }

  void _logoutButtonPressed(context) {
    AppStorage().removeData(USER_DETAILS);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(ScreenRoutes.LOGIN_SCREEN, (route) => false);
  }
}

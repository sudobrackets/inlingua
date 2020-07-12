import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/theme/app_themes.dart';
import 'package:inlingua/src/assets/theme/theme_bloc.dart';
import 'package:inlingua/src/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:inlingua/src/blocs/language_list/language_list_bloc.dart';
import 'package:inlingua/src/blocs/login/login_bloc.dart';
import 'package:inlingua/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:inlingua/src/data/store/app_store.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/batches_details/batches_details_screen.dart';
import 'package:inlingua/src/ui/screen/batches_list/batches_list_screen.dart';
import 'package:inlingua/src/ui/screen/forgot_password/forgot_password.dart';
import 'package:inlingua/src/ui/screen/init/init_screen.dart';
import 'package:inlingua/src/ui/screen/language_list/language_list_screen.dart';
import 'package:inlingua/src/ui/screen/login/login_screen.dart';
import 'package:inlingua/src/ui/screen/order_status/order_status_screen.dart';
import 'package:inlingua/src/ui/screen/singup/sign_up_screen.dart';
import 'package:connectivity/connectivity.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      child: AppRoutes(),
    );
  }
}

class AppRoutes extends StatefulWidget {
  AppRoutes({Key key}) : super(key: key);

  @override
  _AppRoutesState createState() => _AppRoutesState();
}

class _AppRoutesState extends State<AppRoutes> {
  final bool _connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    checkInitConnection();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      checkInitConnection();
    });
  }

  Future<void> checkInitConnection() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      AppStore().setNetworkStatus(false);
    } else {
      AppStore().setNetworkStatus(true);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Container(
          decoration: BoxDecoration(image: AppImages.appBackground()),
          child: MaterialApp(
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                child: child,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
            initialRoute: ScreenRoutes.INIT_SCREEN,
            theme: AppTheme.themeManager(state.themeType),
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}

// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ScreenRoutes.INIT_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.INIT_SCREEN),
        builder: (BuildContext context) {
          return InitScreen();
        },
      );
      break;
    case ScreenRoutes.LOGIN_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.LOGIN_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
            child: LoginScreen(),
          );
        },
      );
      break;
    case ScreenRoutes.SIGN_UP_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.SIGN_UP_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<SignUpBloc>(
            create: (BuildContext context) => SignUpBloc(),
            child: SingUpScreen(),
          );
        },
      );
      break;
    case ScreenRoutes.FORGOT_PASSWORD_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings:
            const RouteSettings(name: ScreenRoutes.FORGOT_PASSWORD_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<ForgotPasswordBloc>(
            create: (BuildContext context) => ForgotPasswordBloc(),
            child: ForgotPasswordScreen(),
          );
        },
      );
      break;
    case ScreenRoutes.BATCHES_LIST_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.BATCHES_LIST_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
            child: BatchesListScreen(),
          );
        },
      );
      break;
    case ScreenRoutes.BATCHES_DETAILS_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings:
            const RouteSettings(name: ScreenRoutes.BATCHES_DETAILS_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
            child: BatchesDetailsScreen(arguments: settings.arguments),
          );
        },
      );
      break;
    case ScreenRoutes.LANGUAGE_LIST:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.LANGUAGE_LIST),
        builder: (BuildContext context) {
          return BlocProvider<LanguageListBloc>(
            create: (BuildContext context) => LanguageListBloc(),
            child: LanguageList(arguments: settings.arguments),
          );
        },
      );
      break;
    case ScreenRoutes.ORDER_STATUS_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.ORDER_STATUS_SCREEN),
        builder: (BuildContext context) {
          return OrderStatusScreen();
        },
      );
      break;
  }
}

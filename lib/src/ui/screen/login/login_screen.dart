import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';
import 'package:inlingua/src/blocs/login/login_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/data/store/app_storage.dart';
import 'package:inlingua/src/data/store/app_utils.dart';
import 'package:inlingua/src/data/validator/input_validator.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class LoginScreen extends BaseScreen {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loginBloc = BlocProvider.of<LoginBloc>(context);
      _loginBloc.listen(_loginBlocListener);
    });

    super.initState();
  }

  Future<void> _loginBlocListener(LoginState state) async {
    if (state is ProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is LoginSuccessState) {
      showAlert(state.message, callBack: () {
        Navigator.of(context).pushNamed(ScreenRoutes.BATCHES_LIST_SCREEN);
      });
    } else if (state is LoginFailedState) {
      showAlert(state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: MediaQuery.of(context).padding.top + 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildLoginheader(),
              _buildLoginWrap(),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildLoginheader() {
    return Center(child: AppImages.logo());
  }

  Container _buildLoginWrap() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: AppWidgetSize.containerWrapRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buidlHeading(),
          _buildInputSection(),
          _buildUserPreferenceSection(),
          _buildButtonSection(),
        ],
      ),
    );
  }

  Wrap _buidlHeading() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(
          AppTextConstants.LOGIN,
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            AppTextConstants.LOGIN_SUBHEADING,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }

  Padding _buildInputSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Wrap(
        children: <Widget>[
          _buildInpuField(
            TextField(
              controller: _usernameController,
              // inputFormatters: InputValidator.username,
              decoration: const InputDecoration(
                hintText: AppTextConstants.EMAIL_ADDRESS,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _buildInpuField(
              TextField(
                controller: _passwordController,
                inputFormatters: InputValidator.password,
                decoration: const InputDecoration(
                  hintText: AppTextConstants.PASSWORD,
                ),
                obscureText: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildInpuField(TextField textField) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: textField,
    );
  }

  Row _buildUserPreferenceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: AppTextConstants.NEW_USER + '?',
            style: Theme.of(context).textTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(
                text: AppTextConstants.SIGN_UP,
                style: Theme.of(context).accentTextTheme.subtitle1,
                recognizer: TapGestureRecognizer()..onTap = _signUpTextPressed,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: _forgotPasswordTextPressed,
          child: Text(
            AppTextConstants.FORGOT_PASSWORD + '?',
            style: Theme.of(context).accentTextTheme.subtitle1,
          ),
        )
      ],
    );
  }

  void _signUpTextPressed() {
    Navigator.of(context).pushNamed(ScreenRoutes.SIGN_UP_SCREEN);
  }

  void _forgotPasswordTextPressed() {
    Navigator.of(context).pushNamed(ScreenRoutes.FORGOT_PASSWORD_SCREEN);
  }

  Padding _buildButtonSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: RaisedButton(
          elevation: 0,
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppWidgetSize.buttonBorderRadius,
          ),
          onPressed: _loginButtonPressed,
          child: Text(
            AppTextConstants.LOGIN.toUpperCase(),
            style: Theme.of(context).textTheme.button,
            // style:  ,
          ),
        ),
      ),
    );
  }

  void _loginButtonPressed() {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();
    if (username == '' || !AppUtils().validateEmail(username)) {
      showAlert('Please enter valid Email Address');
    } else if (password == '') {
      showAlert('Please enter valid password');
    } else {
      Map<String, dynamic> payload = {
        'email_id': username,
        'password': password
      };
      _loginBloc.add(FetchUserLoginEvent(payload));
    }
  }
}

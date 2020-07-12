import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';
import 'package:inlingua/src/assets/theme/app_colors.dart';
import 'package:inlingua/src/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/data/store/app_utils.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class ForgotPasswordScreen extends BaseScreen {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseScreenState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  ForgotPasswordBloc _forgotPasswordBloc;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
      _forgotPasswordBloc.listen(_forgotPasswordBlocListener);
    });

    super.initState();
  }

  Future<void> _forgotPasswordBlocListener(ForgotPasswordState state) async {
    if (state is ProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is ForgotPasswordSuccessState) {
      showAlert(state.message, callBack: () {
        Navigator.of(context).pushReplacementNamed(ScreenRoutes.LOGIN_SCREEN);
      });
    } else if (state is ForgotPasswordFailedState) {
      showAlert(state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          backButton(),
        ],
      ),
    );
  }

  Container _buildBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: MediaQuery.of(context).padding.top,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildForgotPasswordheader(),
              _buildForgotPasswordWrap(),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildForgotPasswordheader() {
    return Center(child: AppImages.logo());
  }

  Container _buildForgotPasswordWrap() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: AppWidgetSize.containerWrapRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.appShadowColor,
            blurRadius: 15,
            offset: Offset(10, 13),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buidlHeading(),
          _buildInputSection(),
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
          AppTextConstants.FORGOT_PASSWORD.toUpperCase(),
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            AppTextConstants.RECOVER_PASSWORD,
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
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: AppTextConstants.EMAIL_ADDRESS,
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
            AppTextConstants.SEND_RESET_CODE.toUpperCase(),
            style: Theme.of(context).textTheme.button,
            // style:  ,
          ),
        ),
      ),
    );
  }

  void _loginButtonPressed() {
    final String email = _emailController.text.trim();
    bool emailPatten = AppUtils().validateEmail(email);
    if (email == '' || !emailPatten) {
      showAlert('Please enter a valid Email Address');
    } else {
      Map<String, dynamic> payload = {
        'email_id': email,
      };
      _forgotPasswordBloc.add(ForgotRequestEvent(payload));
    }
  }
}

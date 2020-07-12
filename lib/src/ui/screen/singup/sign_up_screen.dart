import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';
import 'package:inlingua/src/assets/theme/app_colors.dart';
import 'package:inlingua/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/data/store/app_utils.dart';
import 'package:inlingua/src/data/validator/input_validator.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class SingUpScreen extends BaseScreen {
  SingUpScreen({Key key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends BaseScreenState<SingUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  SignUpBloc _signUpBloc;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _signUpBloc = BlocProvider.of<SignUpBloc>(context);
      _signUpBloc.listen(_signUpBlocListener);
    });

    super.initState();
  }

  Future<void> _signUpBlocListener(SignUpState state) async {
    if (state is ProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is SignUpSuccessState) {
      showAlert(state.message, callBack: () {
        Navigator.of(context).pushReplacementNamed(ScreenRoutes.LOGIN_SCREEN);
      });
    } else if (state is SignUpFailedState) {
      showAlert(state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildSignUpheader(),
              _buildSignUpWrap(),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildSignUpheader() {
    return Center(child: AppImages.logo());
  }

  _buildSignUpWrap() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
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

  _buidlHeading() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(
          AppTextConstants.SIGN_UP.toUpperCase(),
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            AppTextConstants.SIGN_UP_SUBHEADING,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }

  Padding _buildInputSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Wrap(
        children: <Widget>[
          _buildInpuField(
            TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _usernameController,
              inputFormatters: InputValidator.username,
              decoration: const InputDecoration(
                hintText: AppTextConstants.FULL_NAME,
              ),
            ),
          ),
          _buildInpuField(
            TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: AppTextConstants.EMAIL_ADDRESS,
              ),
            ),
          ),
          _buildInpuField(
            TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _phoneNumberController,
              inputFormatters: InputValidator.mobileNumberRegEx,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: AppTextConstants.MOBILE_NUMBER,
              ),
            ),
          ),
          _buildInpuField(
            TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _passwordController,
              inputFormatters: InputValidator.password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: AppTextConstants.PASSWORD,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildInpuField(TextField textField) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
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
      padding: const EdgeInsets.only(top: 20),
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
            AppTextConstants.CREATE_ACCOUNT.toUpperCase(),
            style: Theme.of(context).textTheme.button,
            // style:  ,
          ),
        ),
      ),
    );
  }

  void _loginButtonPressed() {
    final String firstName = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String phoneNumber = _phoneNumberController.text.trim();
    // final String confirmPass = _confirmPasswordController.text.trim();
    bool emailPatten = AppUtils().validateEmail(email);
    if (firstName == '') {
      showAlert('Please enter a valid Full Name');
    } else if (email == '' || !emailPatten) {
      showAlert('Please enter a valid Email Address');
    } else if (phoneNumber == '' || phoneNumber.length != 10) {
      showAlert('Please enter a valid Phone Number');
    } else if (password == '') {
      showAlert('Please enter a valid Password');
    } else {
      Map<String, dynamic> payload = {
        'name': firstName,
        'email_id': email,
        'phone_number': phoneNumber,
        'password': password
      };
      _signUpBloc.add(SingUpRequestEvent(payload));
    }
  }
}

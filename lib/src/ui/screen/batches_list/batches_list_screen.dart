import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/blocs/login/login_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class BatchesListScreen extends BaseScreen {
  BatchesListScreen({Key key}) : super(key: key);

  @override
  _BatchesListScreenState createState() => _BatchesListScreenState();
}

class _BatchesListScreenState extends BaseScreenState<BatchesListScreen> {
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
    if (state is LoginSuccessState) {
      Navigator.of(context).pushReplacementNamed(ScreenRoutes.HOME_SCREEN);
    } else if (state is LoginFailedState) {
      showAlert('Invalid user credential');
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(),
          AppImages.logo(
            width: 150,
            height: 38,
          ),
          GestureDetector(
            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  Container _buildBody() {
    List<Map<String, dynamic>> listBatches = [
      {
        'icon': AppImages.outline(context),
        'label': AppTextConstants.FREE_BATCHES
      },
      {
        'icon': AppImages.group(context),
        'label': AppTextConstants.GROUP_BATCHES
      },
      {
        'icon': AppImages.privateAccount(context),
        'label': AppTextConstants.PRIVATE_BATCHES
      },
      {
        'icon': AppImages.playing(context),
        'label': AppTextConstants.KIDS_BATCHES
      },
      {
        'icon': AppImages.conversation(context),
        'label': AppTextConstants.FORUM_BATCHES
      }
    ];
    List<Widget> batchList = List.generate(
      listBatches.length,
      (int index) {
        Map listItem = listBatches[index];
        return GestureDetector(
          onTap: () => _batchCardPressed(listItem),
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 90,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 30,
                  child: listItem['icon'],
                ),
                Expanded(
                  flex: 70,
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      listItem['label'],
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Text(
                AppTextConstants.BATCHES.toUpperCase(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ...batchList,
          ],
        ),
      ),
    );
  }

  void _batchCardPressed(listItem) {
    Navigator.of(context)
        .pushNamed(ScreenRoutes.BATCHES_DETAILS_SCREEN, arguments: listItem);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/styles/app_widget_size.dart';
import 'package:inlingua/src/blocs/login/login_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/ui/navigation/screen_routes.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class BatchesDetailsScreen extends BaseScreen {
  Map<String, dynamic> arguments;
  BatchesDetailsScreen({Key key, this.arguments}) : super(key: key);

  @override
  _BatchesDetailsScreenState createState() => _BatchesDetailsScreenState();
}

class _BatchesDetailsScreenState extends BaseScreenState<BatchesDetailsScreen> {
  LoginBloc _loginBloc;
  String batchName = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loginBloc = BlocProvider.of<LoginBloc>(context);
      _loginBloc.listen(_loginBlocListener);
    });
    batchName = widget.arguments['label'];
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
          backButton(),
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
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              children: <Widget>[
                AppImages.photo(height: 185, width: double.infinity),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'English',
                            style: Theme.of(context).accentTextTheme.headline3,
                          ),
                          Text(
                            'Spanish',
                            style: Theme.of(context).accentTextTheme.headline3,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          'English Communication Skills-July-Weekend-V992020',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              AppImages.calendar(
                                context,
                                color: Theme.of(context).accentIconTheme.color,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '04-07-2020',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              AppImages.babyChair(
                                context,
                                color: Theme.of(context).accentIconTheme.color,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '15',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '₹ 12999',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                elevation: 0,
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      AppWidgetSize.buttonBorderRadius,
                                ),
                                child: Text(
                                  AppTextConstants.VIEW_DETAILS.toUpperCase(),
                                  style: Theme.of(context).textTheme.button,
                                  // style:  ,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                batchName.toUpperCase(),
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
    // Navigator.of(context)
    //     .pushNamed(ScreenRoutes.BATCHES_DETAILS_SCREEN, arguments: listItem);
  }
}

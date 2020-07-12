import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/styles/app_images.dart';
import 'package:inlingua/src/assets/theme/app_colors.dart';
import 'package:inlingua/src/blocs/language_list/language_list_bloc.dart';
import 'package:inlingua/src/constants/app_text_constants.dart';
import 'package:inlingua/src/models/language_list/language_list_response_mdoel.dart';
import 'package:inlingua/src/ui/screen/base/base_screen.dart';

class LanguageList extends BaseScreen {
  Map arguments;
  LanguageList({this.arguments, key}) : super(key: key);

  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends BaseScreenState<LanguageList> {
  final TextEditingController _searchController = TextEditingController();
  LanguageListBloc _languageListBloc;
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _languageListBloc = BlocProvider.of<LanguageListBloc>(context);
      _languageListBloc.listen(_languageListBlocListener);

      _languageListBloc.add(FetchLanguageListEvent());
    });

    super.initState();
  }

  Future<void> _languageListBlocListener(LanguageListState state) async {
    if (state is ProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is LanguageListFailedState) {
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          backButton(),
          AppImages.logo(
            width: 150,
            height: 38,
          ),
          GestureDetector(
            onTap: _menuButtonPressed,
            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  void _menuButtonPressed() {}

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTextConstants.CHOOSE_LANGUAGE,
            style: Theme.of(context).textTheme.headline6,
          ),
          _searchBarSection(),
          Expanded(
            child: _languageListSection(),
          )
        ],
      ),
    );
  }

  Container _searchBarSection() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 16, right: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: AppTextConstants.SEARCH_LANGUAGE,
                hintStyle:
                    Theme.of(context).inputDecorationTheme.hintStyle.copyWith(
                          color: AppColors.inpuHintColor,
                        ),
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.search,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _languageListSection() {
    return BlocBuilder<LanguageListBloc, LanguageListState>(condition:
        (LanguageListState prevState, LanguageListState currentState) {
      return currentState is LanguageListDoneState;
    }, builder: (BuildContext context, LanguageListState state) {
      if (state is LanguageListDoneState) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: state.languageList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              LanguageListModel languageListItem = state.languageList[index];
              return Container(
                height: 80,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).dividerColor,
                    )),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        languageListItem.thumbnailImage,
                        fit: BoxFit.fill,
                        width: 55,
                        height: 41,
                      ),
                    ),
                    Expanded(
                      flex: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          languageListItem.language,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
      return Container();
    });
  }

  void _batchCardPressed(listItem) {}
}

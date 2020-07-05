import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inlingua/src/assets/theme/app_themes.dart';
import 'package:inlingua/src/constants/storage_constants.dart';
import 'package:inlingua/src/data/store/app_storage.dart';

// Event
abstract class ThemeEvent {}

class ThemeInitEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  ChangeThemeEvent({this.themeType});
  final String themeType;
}

// State
abstract class ThemeState {
  ThemeState(this.themeType);
  final String themeType;
}

class ThemeInitState extends ThemeState {
  ThemeInitState() : super(AppTheme.LIGHT_MODE);
}

class ThemeUpdateState extends ThemeState {
  ThemeUpdateState(String themeType) : super(themeType);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeInitState();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeInitEvent) {
      final dynamic _getTheme = await AppStorage().getData(THEME_TYPE);
      final String _themType = (_getTheme ?? AppTheme.LIGHT_MODE) as String;
      yield ThemeUpdateState(_themType);
    } else if (event is ChangeThemeEvent) {
      await AppStorage().setData(THEME_TYPE, event.themeType);
      yield ThemeUpdateState(event.themeType);
    }
  }
}

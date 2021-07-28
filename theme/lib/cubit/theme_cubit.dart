import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool _isDarkTheme = false;
  ThemeCubit() : super(ThemeState(currentTheme: darkTheme));

  void toggleTheme() {
    emit(_isDarkTheme
        ? ThemeState(currentTheme: darkTheme)
        : ThemeState(currentTheme: lightTheme));
  }
}

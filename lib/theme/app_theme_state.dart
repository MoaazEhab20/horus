import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeState {
  final bool isDarkModeEnabled;

  AppThemeState({required this.isDarkModeEnabled});
}

class AppThemeStateNotifier extends StateNotifier<AppThemeState> {
  AppThemeStateNotifier({required bool isDarkModeEnabled})
      : super(AppThemeState(isDarkModeEnabled: isDarkModeEnabled));

  void setDarkTheme() {
    state = AppThemeState(isDarkModeEnabled: true);
  }

  void setLightTheme() {
    state = AppThemeState(isDarkModeEnabled: false);
  }

  void toggleTheme() {
    state = AppThemeState(isDarkModeEnabled: !state.isDarkModeEnabled);
  }
}

final appThemeStateNotifierProvider =
    StateNotifierProvider<AppThemeStateNotifier, AppThemeState>((ref) {
  return AppThemeStateNotifier(isDarkModeEnabled: false);
});

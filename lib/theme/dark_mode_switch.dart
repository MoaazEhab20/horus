import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_state.dart';

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifierProvider);
    final appThemeNotifier = ref.read(appThemeStateNotifierProvider.notifier);

    return Switch(
      activeColor: Colors.white,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.black,
      value: appThemeState.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          appThemeNotifier.setDarkTheme();
        } else {
          appThemeNotifier.setLightTheme();
        }

        // Save the preference
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool("isDarkModeEnabled", enabled);
        });
      },
    );
  }
}
import 'package:final_project/screens/first_screen.dart';
import 'package:final_project/screens/onboarding_view.dart';
import 'package:final_project/screens/tourguideview/profile_pages/tourguide_profile_settings_screen.dart';
import 'package:final_project/screens/tourguideview/profile_pages/tourguide_setting_screen.dart';
import 'package:final_project/screens/touristview/home_pages/entertainment_screen.dart';
import 'package:final_project/screens/touristview/home_pages/hotel_screen.dart';
import 'package:final_project/screens/touristview/home_pages/landmark_screen.dart';
import 'package:final_project/screens/touristview/profile_pages/about_screen.dart';
import 'package:final_project/screens/touristview/home_pages/tourguide_screen.dart';
import 'package:final_project/screens/touristview/home_pages/transportation_screen.dart';
import 'package:final_project/theme/app_theme.dart';
import 'package:final_project/theme/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/tourguideview/profile_pages/tourguide_about_screen.dart';
import 'screens/touristview/profile_pages/profile_settings_screen.dart';
import 'screens/touristview/profile_pages/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkModeEnabled = prefs.getBool("isDarkModeEnabled") ?? false;
  final onboarding = prefs.getBool("onboarding") ?? false;

  runApp(
    ProviderScope(
      overrides: [
        appThemeStateNotifierProvider.overrideWith(
          (ref) => AppThemeStateNotifier(isDarkModeEnabled: isDarkModeEnabled),
        ),
      ],
      child: MyApp(onboarding: onboarding),
    ),
  );
}
//bhhbbbbk
//a7a
//aaaaaaaaaa
class MyApp extends HookConsumerWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final appThemeState = ref.watch(appThemeStateNotifierProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      routes: {
        'HotelScreen': (context) => HotelsScreen(),
        'LandmarkScreen': (context) => LandmarkScreen(),
        'TourguideScreen': (context) => TourguideScreen(),
        'EntertainmentScreen': (context) => EntertainmentScreen(),
        'TransportScreen': (context) => TransportScreen(),
        'SettingScreen': (context) => SettingScreen(),
        'ProfileSettingScreen': (context) => ProfileSettingsScreen(),
        'AboutScreen': (context) => AboutScreen(),
        'TourguideAboutScreen': (context) => TourguideAboutScreen(),
        'TourguideSettingScreen': (context) => TourguideSettingScreen(),
        'TourguideProfileSettingScreen': (context) =>
            TourguideProfileSettingsScreen(),
      },
      home: onboarding ? const FirstScreen() : const OnboardinView(),
    );
  }
}

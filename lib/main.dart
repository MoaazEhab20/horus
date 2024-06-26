import 'package:final_project/screens/touristview/profile_pages/profile_settings_screen.dart';
import 'package:final_project/screens/touristview/profile_pages/setting_screen.dart';
import 'package:final_project/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/screens/first_screen.dart';
import 'package:final_project/screens/onboarding_view.dart';
import 'package:final_project/screens/touristview/home_pages/entertainment_screen.dart';
import 'package:final_project/screens/touristview/home_pages/hotel_screen.dart';
import 'package:final_project/screens/touristview/home_pages/landmark_screen.dart';
import 'package:final_project/screens/touristview/profile_pages/about_screen.dart';
import 'package:final_project/screens/touristview/home_pages/tourguide_screen.dart';
import 'package:final_project/screens/touristview/home_pages/transportation_screen.dart';
import 'package:final_project/theme/app_theme.dart';
import 'package:final_project/theme/app_theme_state.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/register_tour_guide__cubit.dart';

int indexCity = 1;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  final prefs = await SharedPreferences.getInstance();
  indexCity = prefs.getInt('indexCity') ?? 1;
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

class MyApp extends HookConsumerWidget {
  final bool onboarding;

  const MyApp({Key? key, required this.onboarding}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final appThemeState = ref.watch(appThemeStateNotifierProvider);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context)=> RegisterTourGuideCubit()),
      ],
      child: MaterialApp(
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
        },
        home: onboarding ? FirstScreen() : OnboardinView(),
      ),
    );
  }
}

import 'package:application/presentation/home_screen/binding/home_binding.dart';
import 'package:application/presentation/home_screen/home_screen.dart';
import 'package:application/presentation/login_screen/login_screen.dart';
import 'package:application/presentation/nav_bar_main/navbar_main_screen.dart';
import 'package:application/presentation/notification_screen/binding/notification_binding.dart';
import 'package:application/presentation/notification_screen/notification_screen.dart';
import 'package:application/presentation/profile_screen/binding/proflie_binding.dart';
import 'package:application/presentation/profile_screen/profile_screen.dart';
import 'package:application/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:application/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:application/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String homeScreen = '/home';
  static const String mainScreen = '/main';
  static const String profileScreen = '/profile';
  static const String notificationScreen = '/notification';
  static const String signUpScreen = '/signup';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),

    //login
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(name: mainScreen, page: () => const MainScreen()),

    //home
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    //profile
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    //notification
    GetPage(
      name: notificationScreen,
      page: () => const NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    //signup
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
  ];
}

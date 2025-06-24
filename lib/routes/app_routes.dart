import 'package:application/presentation/home_screen/binding/home_binding.dart';
import 'package:application/presentation/home_screen/home_screen.dart';
import 'package:application/presentation/login_screen/login_screen.dart';
import 'package:application/presentation/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String homeScreen = '/home';

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

    //home
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}

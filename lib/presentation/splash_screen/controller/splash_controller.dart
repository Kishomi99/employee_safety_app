import 'package:application/routes/app_routes.dart';
import 'package:get/get.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      //checkLoginStatus();
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }
}

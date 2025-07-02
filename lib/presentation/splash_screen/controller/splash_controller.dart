import 'package:application/core/utils/pref_utils.dart';
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
      checkLoginStatus();
    });
  }

  void checkLoginStatus() async {
    await PrefUtils().init();

    String token = PrefUtils().getToken();
    print('token is $token');

    if (token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.mainScreen);
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }
}

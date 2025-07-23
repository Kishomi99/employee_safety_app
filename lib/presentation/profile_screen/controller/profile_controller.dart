import 'package:application/data/models/user_model/user_model.dart';

import '../../../core/app_export.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class ProfileController extends GetxController {
  String referenceNo = "";
  String userName = "";
  String position = "";
  RxBool isLoading = false.obs;
  String userRole = "";
  var model = MainUser();
  @override
  void onInit() {
    super.onInit();

    var prefUtils = Get.put(PrefUtils());
    userRole = prefUtils.getUserRole();
    final arguments = Get.arguments;
    if (arguments != null) {
      model = arguments['data'];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  static Future<void> logout() async {
    await PrefUtils.logout();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}

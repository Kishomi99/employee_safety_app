import 'package:application/core/utils/pref_utils.dart';
import 'package:get/get.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class MainScreenNavController extends GetxController {
  RxInt selectedIndex = 1.obs;
  String? userRole;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  @override
  void onReady() {}

  @override
  void onInit() {
    super.onInit();
    var prefUtils = Get.put(PrefUtils());
    userRole = prefUtils.getUserRole();
    print(userRole);
  }
}

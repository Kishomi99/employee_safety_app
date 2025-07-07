import 'package:application/presentation/manager_home_screen/controller/manager_home_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashScreen.
///
/// This class ensures that the SplashController is created when the
/// SplashScreen is first loaded.
class ManagerHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerHomeController());
  }
}

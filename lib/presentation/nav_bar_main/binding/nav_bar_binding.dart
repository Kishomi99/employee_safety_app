import 'package:application/presentation/nav_bar_main/controller/nav_bar_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashScreen.
///
/// This class ensures that the SplashController is created when the
/// SplashScreen is first loaded.
class MainScreenNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenNavController());
  }
}

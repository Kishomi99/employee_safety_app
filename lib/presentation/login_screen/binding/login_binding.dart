import 'package:application/presentation/login_screen/controller/login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginOneScreen.
///
/// This class ensures that the LoginOneController is created when the
/// LoginOneScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

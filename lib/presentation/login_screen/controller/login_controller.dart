import '../../../core/app_export.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxnBool maskEnable = RxnBool(true);
}

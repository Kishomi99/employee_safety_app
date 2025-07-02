import 'package:application/presentation/login_screen/model/login_model.dart';
import 'package:application/presentation/login_screen/model/login_response_model.dart';
import 'package:get/get.dart';
import '../../../core/app_export.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxnBool maskEnable = RxnBool(true);
  RxBool isLoading = false.obs;
  RxString selectedRole = ''.obs;
  Rx<DropDownModel> dropDownItems = DropDownModel().obs;
  RxBool loged = false.obs;
  var token;
  var prefUtils;

  LoginModel loginModel = LoginModel();

  @override
  void onReady() async {
    super.onReady();
    // Additional initialization if needed
  }

  //role dropdown
  void onSelectRole(SelectionPopupModel value) {
    selectedRole.value = value.title;
    for (var element in dropDownItems.value.roleItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    dropDownItems.value.roleItemList.refresh();
  }

  //Future<void> callLogin(Function(dynamic error)? onError) async {
  Future<void> callLogin() async {
    loginModel = LoginModel(
        email: usernameController.text.trim(),
        password: passwordController.text,
        role: selectedRole.value,
        deviceToken: token);
    try {
      isLoading.value = true;
      await Get.put(ApiClient()).login(
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        requestData: loginModel.toJson(),
        onSuccess: (response) async {
          await onCreateLoginSuccess(response);
        },
        onError: (error) {
          isLoading.value = false;
          Get.snackbar(
            'Error',
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        },
      );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future onCreateLoginSuccess(LoginResponseModel response) async {
    await PrefUtils.setToken(response.accessToken);
    await PrefUtils.setUserId(response.user.id);
    print(response.accessToken);
    await PrefUtils.setLogged(true);
    Get.offAllNamed(AppRoutes.mainScreen);
    clearValue();
  }

  // Future<void> setPreference(LoginResponseModel response) async {
  //   await prefUtils.setToken(response.accessToken);
  //   await PrefUtils.setLogged(true);
  // }

  void clearValue() {
    usernameController.clear();
    passwordController.clear();
    selectedRole.value = '';
  }
}

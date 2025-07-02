import 'package:application/core/app_export.dart';
import 'package:application/presentation/sign_up_screen/models/sign_up_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxnBool maskEnable = RxnBool(true);
  TextEditingController positionController = TextEditingController();
  TextEditingController currentWorkPlaceController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  RxString selectedRole = ''.obs;
  RxString selectedGender = ''.obs;
  Rx<DropDownModel> dropDownItems = DropDownModel().obs;

//
  final RxBool submitted = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  int? selectedGenderId = 0;
  void onSelectGender(SelectionPopupModel value) {
    selectedGender.value = value.title;
    selectedGenderId = value.id;
    for (var element in dropDownItems.value.genderItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    dropDownItems.value.genderItemList.refresh();
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

  SignUpModel get signUpModel => SignUpModel(
        name: nameController.text,
        email: emailController.text,
        gender: selectedGender.value,
        password: passwordController.text,
        role: selectedRole.value,
        position: positionController.text,
        currentWorkplace: currentWorkPlaceController.text,
        mobileNumber: mobileNumController.text,
        profilePhoto: '',
      );

  Future<void> registerUser() async {
    try {
      isLoading.value = true;
      await Get.put(ApiClient()).register(
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        requestData: signUpModel.toJson(),
        onSuccess: onRegisterSuccess,
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

  void onRegisterSuccess(dynamic response) async {
    await PrefUtils.setLogged(true);
    Get.offAllNamed(AppRoutes.loginScreen);
    Get.snackbar(
      'Success',
      'Registration successful',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

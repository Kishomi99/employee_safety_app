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
  int userId = 0;
  @override
  void onInit() {
    super.onInit();

    var prefUtils = Get.put(PrefUtils());
    prefUtils.init();
    userId = prefUtils.getUserId();

    // Initialize any necessary data or state here
  }

  @override
  void onReady() {
    getUserById();
    super.onReady();
  }

  static Future<void> logout() async {
    await PrefUtils.logout();
    Get.offAllNamed('/login');
  }

  Future<void> getUserById() async {
    try {
      isLoading.value = true;
      var token = Get.find<PrefUtils>().getToken();
      await Get.put(ApiClient()).getUserById(
        userId: userId,
        headers: {
          'Authorization': "Bearer $token",
        },
        onSuccess: (response) async {
          await onGetUserByID(response);
        },
        onError: (error) {
          // Handle error response
          Get.snackbar(
            'Error',
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> onGetUserByID(MainUser response) async {
    referenceNo = response.referenceNumber ?? "";
    position = response.userInformation!.position!;
    userName = response.name!;
    print(response);
  }
}

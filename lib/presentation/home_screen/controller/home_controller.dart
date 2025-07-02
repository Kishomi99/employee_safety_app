import 'package:application/core/app_export.dart';
import 'package:application/data/models/user_model/user_model.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current HomeModelObj
class HomeController extends GetxController {
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
    getUserById();
    // Initialize any necessary data or state here
  }

  Future<void> getUserById() async {
    try {
      isLoading.value = true;
      await Get.put(ApiClient()).getUserById(
        userId: userId,
        onSuccess: (response) async {
          await onGetUserByID(response);
          // Handle successful response
          print('User data retrieved successfully: $response');
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
    referenceNo = response.referenceNumber!;
    position = response.userInformation!.position!;
    userName = response.name!;
    print(response);
  }

  @override
  void onReady() {}
}

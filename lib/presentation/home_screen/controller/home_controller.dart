import 'package:application/core/app_export.dart';
import 'package:application/data/models/user_model/user_model.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current HomeModelObj
class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  int userId = 0;
  @override
  void onInit() async {
    super.onInit();

    var prefUtils = Get.put(PrefUtils());
    userId = prefUtils.getUserId();
    await getUserDetailsById();
    // Initialize any necessary data or state here
  }

  @override
  void onReady() {
    super.onReady();
    //  getUserDetailsById();
  }

  Future<void> getUserDetailsById() async {
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
      print('Error fetching user data: $e');
    }
  }

  late MainUser? mainUser = MainUser();
  Future<void> onGetUserByID(MainUser response) async {
    mainUser = response;
  }
}

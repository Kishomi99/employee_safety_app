import 'package:application/core/app_export.dart';

class QuitDialog {
  static Future<dynamic> quitDialog({
    required String title,
    required String middleText,
    required String textBtnConfirm,
    required String textBtnCancel,
    void Function()? cancel,
    void Function()? confirm,
  }) async {
    return Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: AppColors.primary),
      middleText: middleText,
      middleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      textConfirm: textBtnConfirm,
      confirmTextColor: AppColors.white,
      textCancel: textBtnCancel,
      cancelTextColor: Colors.black,
      backgroundColor: AppColors.white,
      buttonColor: AppColors.primary,
      onCancel: cancel,
      onConfirm: confirm,
    );
  }

  static Future<dynamic> cancelDialog() async {
    return Get.defaultDialog(
        title: "lbl_are_u_sure".tr,
        titleStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
        middleText: "msg_are_u_sure".tr,
        middleTextStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        textConfirm: "lbl_yes".tr,
        confirmTextColor: AppColors.white,
        textCancel: "lbl_no".tr,
        cancelTextColor: Colors.black,
        backgroundColor: AppColors.white,
        buttonColor: AppColors.primary,
        onCancel: () {
          Get.back();
        },
        onConfirm: () {
          Get.back();
          Get.back();
        });
  }
}

import 'package:application/core/app_export.dart';
import 'package:application/core/helper/exit_dailog.dart';
import 'package:application/presentation/sign_up_screen/widget/custom_text_form_field.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(255, 223, 212, 228),
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text('register_user'.tr, style: AppStyle.textWhite),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () => Get.back(),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustumButton(
                width: screensize.width * 0.4,
                text: 'cancel'.tr,
                isOutlined: true,
                onPressed: () {
                  QuitDialog.quitDialog(
                      title: "lbl_are_u_sure".tr,
                      middleText: "msg_are_u_sure".tr,
                      textBtnConfirm: "lbl_yes".tr,
                      textBtnCancel: "lbl_no".tr,
                      confirm: () {
                        FocusScope.of(context).unfocus();
                        //controller.clearValues();
                        Get.back();
                        Get.back();
                      },
                      cancel: () {});
                },
              ),
              const SizedBox(width: 10),
              CustumButton(
                width: screensize.width * 0.4,
                text: 'sign_up'.tr,
                backgroundColor: AppColors.primary.withOpacity(0.9),
                onPressed: () {
                  controller.submitted.value = true;
                  if (_formKey.currentState!.validate()) {
                    controller.registerUser();
                    //controller.registerUser();
                  }
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: controller.submitted.value
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          CustomTextFormField(
                            label: 'name',
                            hintText: 'hint_name',
                            isAsteriskRequired: true,
                            keyboardType: TextInputType.name,
                            controller: controller.nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'val_name'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //mail
                          CustomTextFormField(
                            label: 'email',
                            hintText: 'hint_name',
                            isAsteriskRequired: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'val_email'.tr;
                              } else if (!GetUtils.isEmail(value)) {
                                return 'val_email2'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //gender
                          Row(
                            children: [
                              Text("gender".tr, style: AppStyle.lableText),
                              const SizedBox(width: 5),
                              Text(
                                '*',
                                style: AppStyle.inputText
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Obx(() {
                            return CustomDropdown(
                              items: controller
                                  .dropDownItems.value.genderItemList.value,
                              onChanged: (value) {
                                controller.onSelectGender(value);
                              },
                              validator: (value) {
                                if (value == null || value.id == 0) {
                                  return 'val_gender'.tr;
                                }
                                return null;
                              },
                            );
                            ;
                          }),
                          const SizedBox(
                            height: 10,
                          ),

                          //Role
                          Row(
                            children: [
                              Text("role".tr, style: AppStyle.lableText),
                              const SizedBox(width: 5),
                              Text(
                                '*',
                                style: AppStyle.inputText
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Obx(() {
                            return CustomDropdown(
                              items: controller
                                  .dropDownItems.value.roleItemList.value,
                              onChanged: (value) {
                                controller.onSelectRole(value);
                              },
                              validator: (value) {
                                if (value == null || value.id == 0) {
                                  return 'val_role'.tr;
                                }
                                return null;
                              },
                            );
                            ;
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          //position
                          CustomTextFormField(
                            label: 'position',
                            hintText: 'hint_position',
                            isAsteriskRequired: true,
                            keyboardType: TextInputType.name,
                            controller: controller.positionController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'val_position'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //current work place
                          CustomTextFormField(
                            label: 'current_work_place',
                            hintText: 'hint_current_work_place',
                            isAsteriskRequired: true,
                            keyboardType: TextInputType.name,
                            controller: controller.currentWorkPlaceController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'val_current_work_place'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //mobile number
                          CustomTextFormField(
                            label: 'mob_num',
                            hintText: 'hint_mobile_num',
                            isAsteriskRequired: true,
                            keyboardType: TextInputType.phone,
                            controller: controller.mobileNumController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'val_mobile_num'.tr;
                              } else if (!GetUtils.isPhoneNumber(value)) {
                                return 'val_mobile_num2'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //password
                          Row(
                            children: [
                              Text("password".tr, style: AppStyle.lableText),
                              const SizedBox(width: 5),
                              Text(
                                '*',
                                style: AppStyle.inputText
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.maskEnable.value ?? true,
                              autofocus: false,
                              keyboardType: TextInputType.visiblePassword,
                              style: AppStyle.inputText,
                              decoration: InputDecoration(
                                hintText: 'hint_password'.tr,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 16.0,
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (controller.maskEnable.value ?? true)
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.primary,
                                  ),
                                  onPressed: () {
                                    controller.maskEnable.value =
                                        !(controller.maskEnable.value ?? true);
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'val_password'.tr;
                                } else if (value.length < 6) {
                                  return 'val_password2'.tr;
                                }
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

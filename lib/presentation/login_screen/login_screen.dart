import 'package:application/widgets/custum_button.dart';

import '../../core/app_export.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //top
                SizedBox(
                  width: double.infinity,
                  height: screensize.height * 0.45,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageConstant.homeImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(160),
                          ),
                        ),
                      ),

                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // AppColors.lightpurple.withOpacity(0.7),
                              AppColors.secondary.withOpacity(0.7),
                              AppColors.primary.withOpacity(1.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(160),
                          ),
                        ),
                      ),

                      // Content over image + gradient

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 180),
                            Image(
                              image: AssetImage(ImageConstant.logo),
                              width: 75,
                              height: 75,
                            ),
                            Expanded(
                              child: Text(
                                'welcome'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: controller.loged.value
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        TextFormField(
                          style: AppStyle.inputText,
                          controller: controller.usernameController,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "email".tr,
                            hintText: 'hint_email'.tr,
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
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
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.maskEnable.value ?? true,
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
                            style: AppStyle.inputText,
                            decoration: InputDecoration(
                              labelText: 'password'.tr,
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'hint_password'.tr,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
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
                        // Row(
                        //   children: [
                        //     Text("role".tr, style: AppStyle.lableText),
                        //     const SizedBox(width: 5),
                        //     Text(
                        //       '*',
                        //       style: AppStyle.inputText
                        //           .copyWith(color: Colors.red),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 5),
                        Obx(() {
                          return CustomDropdown(
                            lableText: "Role",
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'dont_have_account'.tr,
                      style: AppStyle.homeCardText2.copyWith(
                        color: AppColors.secondary,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                      child: Text(
                        'sign_up'.tr,
                        style: AppStyle.homeCardText2.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustumButton(
                  text: 'login'.tr,
                  onPressed: () {
                    controller.loged.value = true;
                    if (_formKey.currentState!.validate()) {
                      controller.callLogin();
                      controller.clearValue();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

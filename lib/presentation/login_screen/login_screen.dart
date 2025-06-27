import '../../core/app_export.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});
  LoginController loginController = Get.put<LoginController>(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                          image: NetworkImage(
                            'https://media.licdn.com/dms/image/v2/C5612AQFj1fmFwzziHQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1627664460506?e=2147483647&v=beta&t=f4KL_MLAXQIE7_vBPRFx9gNUCsV7-oV12vtnuIPHbRU',
                          ),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
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
                          obscureText: loginController.maskEnable.value ?? true,
                          autofocus: false,
                          keyboardType: TextInputType.visiblePassword,
                          style: AppStyle.inputText,
                          decoration: InputDecoration(
                            labelText: 'password'.tr,
                            prefixIcon: Icon(Icons.password_sharp),
                            hintText: 'hint_password'.tr,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                (loginController.maskEnable.value ?? true)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.primary,
                              ),
                              onPressed: () {
                                loginController.maskEnable.value =
                                    !(loginController.maskEnable.value ?? true);
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: AppColors.primary,
                    minimumSize:
                        Size(screensize.width * 0.9, screensize.height * 0.08),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // All validations passed
                    Get.toNamed('/main');
                    loginController.clearValue();
                  }
                },
                child: Text(
                  'login'.tr,
                  style: AppStyle.homeWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

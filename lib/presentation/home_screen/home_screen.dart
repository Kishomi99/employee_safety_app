import 'package:application/core/app_export.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});
  final String data = "https://www.youtube.com/watch?v=HrFc7W7MxzE&t=96s";

  HomeController loginController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 212, 228),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: screensize.height * 0.23,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.light,
                      AppColors.secondary.withOpacity(0.7),
                      AppColors.primary.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AJX HOLDINGS",
                            style: AppStyle.homeWhite,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: QrImageView(
                              data: data,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.profileScreen,
                                arguments: {
                                  "data": loginController.mainUser,
                                },
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColors.primary,
                              radius: 35,
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                backgroundImage:
                                    AssetImage(ImageConstant.homeImage),
                                radius: 33,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loginController.mainUser!.referenceNumber ?? "",
                                style: AppStyle.homeWhite,
                              ),
                              Text(
                                loginController.mainUser!.name ?? "",
                                style: AppStyle.homeWhite,
                              ),
                              Container(
                                width: 150,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    loginController.mainUser!.userInformation
                                            ?.position ??
                                        "",
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screensize.width * 0.53,
                        height: screensize.height * 0.21,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                (Icons.stars_rounded),
                                size: 40,
                                color: AppColors.primary,
                              ),
                              Text("training".tr, style: AppStyle.homeCardText),
                              const SizedBox(height: 15),
                              Text("Leval 2".tr, style: AppStyle.homeCardText2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    (Icons.star_rate_outlined),
                                    size: 40,
                                    color: Color.fromARGB(255, 240, 227, 109),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("254".tr,
                                      style: AppStyle.homeCardNumber),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: screensize.width * 0.53,
                        height: screensize.height * 0.2,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                (Icons.work_history),
                                size: 40,
                                color: AppColors.primary,
                              ),
                              Text("work".tr, style: AppStyle.homeCardText),
                              const SizedBox(height: 20),
                              Text("working_on".tr,
                                  style: AppStyle.homeCardSmall),
                              const SizedBox(height: 2),
                              Text("site 002".tr,
                                  style: AppStyle.homeCardText3),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: screensize.width * 0.53,
                        height: screensize.height * 0.15,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    (Icons.report),
                                    size: 40,
                                    color: AppColors.primary,
                                  ),
                                  Text("report".tr,
                                      style: AppStyle.homeCardText),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    (Icons.report_problem),
                                    size: 25,
                                    color: Color.fromARGB(255, 230, 157, 47),
                                  ),
                                  SizedBox(width: 10),
                                  Text("3 Incidents".tr,
                                      style: AppStyle.homeCardSmall),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    (Icons.report_problem),
                                    size: 25,
                                    color: Color.fromARGB(255, 230, 157, 47),
                                  ),
                                  SizedBox(width: 10),
                                  Text("3 Audit Reports".tr,
                                      style: AppStyle.homeCardSmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  //2nd Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //insurance
                      Container(
                        width: screensize.width * 0.39,
                        height: screensize.height * 0.16,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                (Icons.health_and_safety),
                                size: 40,
                                color: AppColors.primary,
                              ),
                              Text("insurance".tr,
                                  style: AppStyle.homeCardText),
                              const SizedBox(height: 5),
                              Text("expire_date".tr,
                                  style: AppStyle.homeCardSmall),
                              Text("01 Apr 2026".tr,
                                  style: AppStyle.homeCardText3),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      //course
                      Container(
                        width: screensize.width * 0.39,
                        height: screensize.height * 0.25,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                (Icons.school),
                                size: 40,
                                color: AppColors.primary,
                              ),
                              Text("course".tr, style: AppStyle.homeCardText),
                              const SizedBox(height: 5),
                              Text("completed".tr,
                                  style: AppStyle.homeCardSmall),
                              Row(
                                children: [
                                  Icon(Icons.check_circle_outline,
                                      size: 20,
                                      color: Color.fromARGB(255, 0, 128, 0)),
                                  SizedBox(width: 10),
                                  Text("5".tr, style: AppStyle.homeCardNumber),
                                ],
                              ),
                              Text("pending".tr, style: AppStyle.homeCardSmall),
                              Row(
                                children: [
                                  Icon(
                                    Icons.hourglass_empty,
                                    size: 20,
                                    color: Color(0xFFFFC107),
                                  ),
                                  SizedBox(width: 10),
                                  Text("5".tr, style: AppStyle.homeCardNumber),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      //certificates
                      Container(
                        width: screensize.width * 0.39,
                        height: screensize.height * 0.15,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                (Icons.workspace_premium),
                                size: 40,
                                color: AppColors.primary,
                              ),
                              Text("certificate".tr,
                                  style: AppStyle.homeCardText),
                              const SizedBox(height: 10),
                              SizedBox(height: 2),
                              Text("3 Certifications".tr,
                                  style: AppStyle.homeCardSmall),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            //padding: EdgeInsets.all(30),
          ),
        ),
      ),
    );
  }
}

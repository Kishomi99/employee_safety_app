import 'package:application/core/app_export.dart';
import 'package:application/presentation/profile_screen/controller/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 223, 212, 228),
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text('my_profile'.tr, style: AppStyle.textWhite),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 15.0, left: 15.0, top: 20.0, bottom: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 50,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTheGBYMp1LpqF4j654bYwUPGOPVZpPmkOOohEh_IqP6332oPcynyqsafd3t1H7sbpDwEhuBQ&s"),
                        radius: 47,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('employee_id'.tr, style: AppStyle.homeCardSmall),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('123456', style: AppStyle.homeCardNumber),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      userListTile(lableName: "name".tr, value: 'John Doe'),
                      userListTile(
                          lableName: "position".tr,
                          value: 'Fork Lift Operator'),
                      userListTile(
                          lableName: "current_work_place".tr,
                          value: 'Albany, new York- site 002'),
                      userListTile(
                          lableName: "mob_num".tr, value: '078 678 7899'),
                      userListTile(
                          lableName: "per_mail".tr, value: 'johnram@gmail.com'),
                      userListTile(
                          lableName: "work_mail".tr,
                          value: "john@ajxgmail.com"),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: AppColors.primary,
                      minimumSize: Size(
                          screensize.width * 0.9, screensize.height * 0.08),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    // All validations passed
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'logout'.tr,
                    style: AppStyle.homeWhite,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  ListTile userListTile({required String lableName, required String value}) {
    return ListTile(
      title: Text(lableName, style: AppStyle.inputText),
      subtitle: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          value,
          style: AppStyle.homeCardText2,
        ),
      ),
    );
  }
}

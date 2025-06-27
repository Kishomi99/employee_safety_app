import 'package:application/core/app_export.dart';
import 'package:application/presentation/notification_screen/controller/notification_controller.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 223, 212, 228),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('notification'.tr, style: AppStyle.textPrimary),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5, // Replace with your notification count

                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            children: [
                              // Time label top-right
                              Positioned(
                                right: 0,
                                child: Text('2 min ago',
                                    style: AppStyle.homeCardSmall),
                              ),
                              // Notification content
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.notifications,
                                          color: AppColors.primary),
                                      const SizedBox(width: 10),
                                      Text('Notification ${index + 1}',
                                          style: AppStyle.homeCardText),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 34), // align with text
                                    child: Text(
                                      'This is the description of notification ${index + 1}',
                                      style: AppStyle.homeCardText2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

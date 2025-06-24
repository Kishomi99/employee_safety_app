import 'package:application/core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        color: AppColors.white,
        child: Stack(
          children: [
            Center(
                child: CustomImageView(
              imagePath: ImageConstant.logo,
              height: 200,
            )

                //.animate().fade(duration: Duration(milliseconds: 2000)),
                ),
          ],
        ),
      ),
    ));
  }
}

import 'package:application/core/app_export.dart';
import 'package:application/presentation/home_screen/home_screen.dart';
import 'package:application/presentation/manager_home_screen/manager_home_screen.dart';
import 'package:application/presentation/nav_bar_main/controller/nav_bar_controller.dart';
import 'package:application/presentation/notification_screen/notification_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends GetWidget<MainScreenNavController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const NotificationScreen(),
      _getHomeScreenBasedOnRole(controller.userRole), // Index 1
      _getCertificateScreenBasedOnRole(controller.userRole),
      // HomeScreen(),
      // const NotificationScreen(), // Replace with CertificateScreen() if needed
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 212, 228),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            color: AppColors.secondary,
            buttonBackgroundColor: AppColors.primary,
            animationDuration: const Duration(milliseconds: 300),
            index: controller.selectedIndex.value,
            onTap: controller.changeTab,
            items: const <Widget>[
              Icon(Icons.notifications, size: 30, color: Colors.white),
              Icon(Icons.home, size: 30, color: Colors.white),
              Icon(Icons.card_membership, size: 30, color: Colors.white),
            ],
          )),
      body: Obx(() => pages[controller.selectedIndex.value]),
    );
  }

  Widget _getHomeScreenBasedOnRole(String? role) {
    if (role == 'Manager') {
      return const ManagerHomeScreen(); // Manager-specific home
    } else {
      return HomeScreen(); // Default to employee
    }
  }

  Widget _getCertificateScreenBasedOnRole(String? role) {
    if (role == 'Manager') {
      return const NotificationScreen(); // Manager-specific certificate
    } else {
      return const NotificationScreen(); // Employee-specific certificate
    }
  }
}

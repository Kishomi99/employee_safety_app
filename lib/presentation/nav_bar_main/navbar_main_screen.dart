import 'package:application/presentation/home_screen/home_screen.dart';
import 'package:application/presentation/notification_screen/notification_screen.dart';
import 'package:application/theme/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = const [
    NotificationScreen(),
    HomeScreen(),
    HomeScreen(),
    // CertificateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 212, 228),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        color: AppColors.secondary,
        buttonBackgroundColor: AppColors.primary,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
        items: const <Widget>[
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.card_membership, size: 30, color: Colors.white),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}

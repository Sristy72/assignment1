import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: controller.changeTabIndex,
      selectedItemColor: const Color(0xFF5F6CAF),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analysis"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    ));
  }
}

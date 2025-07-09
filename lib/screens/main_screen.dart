import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/custom_bottom_nav.dart';
import 'home_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    final screens = [
      const HomeScreen(),
      // const ScheduleScreen(),
      // const ProgressScreen(),
      // const ProfileScreen(),
    ];

    return Obx(() => Scaffold(
      body: screens[controller.selectedIndex.value],
      bottomNavigationBar: const CustomBottomNavBar(),
    ));
  }
}

import 'package:assignment1/screens/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const Splash2()); // 👈 Direct screen navigation
    });

    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: const Center(
        child: Text(
          "INTRICATE",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

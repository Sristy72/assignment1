import 'package:assignment1/screens/onboarding_screen/onboarding_screen.dart';
import 'package:assignment1/widgets/get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/access-queries.png', height: 220),
            const SizedBox(height: 30),
            const Text(
              "Your Journey to a Better Mind Starts Here.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "We're here to help you build daily routines that restore balance, joy, and mindfulness — one step at a time.",
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GetStarted(
              text: "Get Started – Free 3-Day Trial",
              onPressed: () {
                Get.to(() => OnboardingScreen()); // 👈 No named route
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/onboarding_controller.dart';
import '../widgets/schedule_button.dart';
import 'home_screen.dart';
import 'main_screen.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Here’s your personalized 7-day reset plan.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              const SizedBox(height: 20),

              Text( textAlign: TextAlign.center,'Each day includes guided tasks to help you feel better, one moment at a time.', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ScheduleButton(
                text: "View Today’s Schedule",
                onTap: () => Get.offAll(() => const MainScreen())
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // regenerate plan
                  controller.currentStep.value = 0;
                  controller.selectedOptions.value = List.filled(5, -1);
                },
                child: const Text(
                  "Regenerate your plan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,      // optional: underline color
                    decorationThickness: 1.5,           // optional: thickness of underline
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
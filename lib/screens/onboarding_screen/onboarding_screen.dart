import 'package:assignment1/widgets/schedule_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_button.dart';
import '../../widgets/step_progress.dart';
import '../home_screen.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // If last step, show final screen
      if (controller.isLastStep) {
        return finalScreen();
      }

      final question = controller.questions[controller.currentStep.value];
      final selected = controller.selectedOptions[controller.currentStep.value];

      return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              StepProgress(
                currentStep: controller.currentStep.value + 1,
                totalSteps: controller.questions.length,
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(question.title, textAlign: TextAlign.start, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(question.subtitle, style:  TextStyle(color: Color(0xFF546881,), fontSize: 16),),
                  const SizedBox(height: 18),
                ]

              ),

              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (_, index) {
                    return OptionButton(
                      text: question.options[index],
                      isSelected: selected == index,
                      onTap: () => controller.selectOption(index),
                    );
                  },
                ),
              ),
              NextButton(
                text: controller.currentStep.value == controller.questions.length - 1
                    ? "Generate My Routine"
                    : "Next",
                onTap: controller.nextStep,
              ),
            ],
          ),
        ),
      );
    });
  }

  // Final screen
  Widget finalScreen() {
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
                onTap: () => Get.to(() => const HomeScreen()),
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

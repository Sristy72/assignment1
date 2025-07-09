import 'package:assignment1/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller.dart';
import '../../widgets/appbar.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_button.dart';
import '../../widgets/step_progress.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // If last step, show final screen
      if (controller.isLastStep) {
        return FinalScreen(controller: controller);
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

}



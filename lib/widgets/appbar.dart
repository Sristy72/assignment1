import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final controller = Get.find<OnboardingController>();

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isFirstStep = controller.currentStep.value == 0;
      return AppBar(
              backgroundColor: Color(0xFFF9F9F9),
              shape: Border(
                bottom: BorderSide(
                  color: Colors.grey, // border color
                  width: .2,
                ),
              ),
              //backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              // disable default leading
              title: Row(
                children: [
                  if (!isFirstStep)
                    TextButton.icon(
                      onPressed: controller.prevStep,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 20,
                      ),
                      label: const Text(
                        'Back',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  const Spacer(), // push title text to the end
                  Text(
                    'Step ${controller.currentStep.value + 1} out of ${controller.questions.length}',
                    style: const TextStyle(
                      color: Color(0xFF5F6CAF),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

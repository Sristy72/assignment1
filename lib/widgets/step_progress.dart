import 'package:flutter/material.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final percent = currentStep / totalSteps;
    final barHeight = 25.0;
    final dotSize = 37.0;
    final duration = Duration(milliseconds: 500);

    return SizedBox(
      height: 40,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background bar
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: constraints.maxWidth,
                  height: barHeight,
                  color: Colors.grey.shade300,
                ),
              ),

              // Animated foreground bar
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percent.clamp(0.0, 1.0)),
                duration: duration,
                builder: (context, value, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: constraints.maxWidth * value,
                      height: barHeight,
                      color: Color(0xFF5F6CAF),
                    ),
                  );
                },
              ),

              // Animated moving dot
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percent.clamp(0.0, 1.0)),
                duration: duration,
                builder: (context, value, child) {
                  double left = (constraints.maxWidth * value) - (dotSize / 2);
                  return Positioned(
                    left: left.clamp(0.0, constraints.maxWidth - dotSize),
                    child: Container(
                      width: dotSize,
                      height: dotSize,
                      decoration: BoxDecoration(
                        color: Color(0xFF5F6CAF),
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.star_border_purple500, color: Colors.white, size: 30),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

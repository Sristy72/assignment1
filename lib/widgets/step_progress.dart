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

    return Container(
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
                      child: Icon(Icons.star_border_purple500, color: Colors.white, size: 30),
                      width: dotSize,
                      height: dotSize,
                      decoration: BoxDecoration(
                        color: Color(0xFF5F6CAF),
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
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



// import 'package:flutter/material.dart';
//
// class FancyProgressBar extends StatelessWidget {
//   final double progress; // 0.0 to 1.0
//
//   const FancyProgressBar({super.key, required this.progress});
//
//   @override
//   Widget build(BuildContext context) {
//     final barHeight = 6.0;
//     final circleSize = 14.0;
//
//     return SizedBox(
//       height: circleSize,
//       child: Stack(
//         alignment: Alignment.centerLeft,
//         children: [
//           // Background bar
//           Container(
//             height: barHeight,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           // Filled bar
//           FractionallySizedBox(
//             widthFactor: progress.clamp(0.0, 1.0),
//             child: Container(
//               height: barHeight,
//               decoration: BoxDecoration(
//                 color: Colors.indigo,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           // Circular dot at the front of filled area
//           Positioned(
//             left: (MediaQuery.of(context).size.width - 32) * progress.clamp(0.0, 1.0) - (circleSize / 2),
//             child: Container(
//               width: circleSize,
//               height: circleSize,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.indigo, width: 3),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
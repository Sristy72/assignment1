import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/day_tracker_controller.dart';
import 'package:intl/intl.dart';

class DayTracker extends StatelessWidget {
  late final List<DateTime> dateObjects;

  DayTracker({super.key}) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    dateObjects = List.generate(7, (i) => yesterday.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DayTrackerController());
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final todayIndex = dateObjects.indexWhere(
          (d) => DateFormat('yMd').format(d) == DateFormat('yMd').format(today),
    );
    if (controller.selectedDateIndex.value == 0 && todayIndex != -1) {
      Future.delayed(Duration.zero, () => controller.selectDate(todayIndex));
    }

    return SizedBox(
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: dateObjects.length * 60.0 + 100, // Enough space to scroll
          child: Stack(
            children: List.generate(dateObjects.length, (index) {
              return Obx(() {
                final isSelected = controller.selectedDateIndex.value == index;
                final isToday = DateFormat('yMd').format(dateObjects[index]) ==
                    DateFormat('yMd').format(today);
                final isYesterday = DateFormat('yMd').format(dateObjects[index]) ==
                    DateFormat('yMd').format(yesterday);

                Color bgColor = Colors.white;
                Color textColor = const Color(0xFF5F6CAF);
                Color dateColor = const Color(0xFF003759);

                if (isToday) {
                  bgColor = Colors.indigo;
                  textColor = Colors.white;
                  dateColor = Colors.white;
                } else if (isYesterday) {
                  bgColor = Colors.green;
                  textColor = Colors.white;
                  dateColor = Colors.white;
                } else if (isSelected) {
                  bgColor = const Color(0xFF5F6CAF);
                  textColor = Colors.white;
                  dateColor = Colors.white;
                }

                bool isSelectable = isToday || isYesterday;

                final double cardWidth = isToday ? 125 : 70;
                final double cardHeight = 110;
                final double leftOffset = index * 50.0;

                return Positioned(
                  left: leftOffset,
                  child: GestureDetector(
                    onTap: isSelectable
                        ? () => controller.selectDate(index)
                        : null,
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: cardWidth,
                        height: cardHeight,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            DateFormat('E').format(dateObjects[index]),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                            const SizedBox(height: 4),
                            isToday
                                ? Text(
                              DateFormat('MMMM d, y')
                                  .format(dateObjects[index]),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: dateColor,
                              ),
                            )
                                : Text(
                              DateFormat('d')
                                  .format(dateObjects[index]),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: dateColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            }).reversed.toList(), // Earlier cards draw on top
          ),
        ),
      ),
    );
  }
}

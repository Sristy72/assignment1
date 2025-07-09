import 'package:get/get.dart';

class DayTrackerController extends GetxController {
  var selectedDateIndex = 0.obs;

  void selectDate(int index) {
    selectedDateIndex.value = index;
  }
}

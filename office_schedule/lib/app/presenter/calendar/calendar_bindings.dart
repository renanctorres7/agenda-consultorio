import 'package:get/get.dart';

import 'calendar_controller.dart';

class CalendarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}

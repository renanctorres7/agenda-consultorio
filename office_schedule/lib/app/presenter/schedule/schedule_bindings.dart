import 'package:get/get.dart';

import 'schedule_controller.dart';

class ScheduleBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ScheduleController());
  }
}

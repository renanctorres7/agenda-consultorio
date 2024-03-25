import 'package:get/get.dart';
import 'package:office_schedule/app/presenter/users/users_controller.dart';

class UsersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UsersControllers());
  }
}

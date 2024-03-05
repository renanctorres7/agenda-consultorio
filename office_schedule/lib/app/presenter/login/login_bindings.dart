import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:office_schedule/app/presenter/login/login_controller.dart';

final s1 = GetIt.instance;

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(loginUsecase: s1()));
  }
}

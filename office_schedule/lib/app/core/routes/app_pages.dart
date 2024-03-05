import 'package:get/get.dart';

import '../../presenter/login/login_bindings.dart';
import '../../presenter/login/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    // GetPage(
    //     name: AppRoutes.splash,
    //     page: () => const SearchPage(),
    //     binding: SearchBindings()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBindings())
  ];
}

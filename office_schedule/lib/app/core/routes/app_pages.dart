import 'package:get/get.dart';

import 'package:office_schedule/app/presenter/home/home_bindings.dart';

import '../../presenter/home/home_page.dart';
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
        binding: LoginBindings()),

    GetPage(
        name: AppRoutes.home, page: () => HomePage(), binding: HomeBindings()),
  ];
}

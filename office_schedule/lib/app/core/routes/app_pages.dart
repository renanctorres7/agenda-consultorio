import 'package:get/get.dart';

import 'package:office_schedule/app/presenter/home/home_bindings.dart';
import 'package:office_schedule/app/presenter/schedule/schedule_bindings.dart';
import 'package:office_schedule/app/presenter/settings/settings_bindings.dart';
import 'package:office_schedule/app/presenter/settings/settings_page.dart';
import 'package:office_schedule/app/presenter/users/users_page.dart';

import '../../presenter/calendar/calendar_bindings.dart';
import '../../presenter/calendar/calendar_page.dart';
import '../../presenter/home/home_page.dart';
import '../../presenter/login/login_bindings.dart';
import '../../presenter/login/login_page.dart';
import '../../presenter/schedule/schedule_page.dart';
import '../../presenter/users/users_bindings.dart';
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
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),

    GetPage(
        name: AppRoutes.schedule,
        page: () => const SchedulePage(),
        binding: ScheduleBindings()),

    GetPage(
        name: AppRoutes.calendar,
        page: () => const CalendarPage(),
        binding: CalendarBindings()),

    GetPage(
        name: AppRoutes.users,
        page: () => const UsersPage(),
        binding: UsersBindings()),

    GetPage(
        name: AppRoutes.settings,
        page: () => const SettingsPage(),
        binding: SettingsBindings()),
  ];
}

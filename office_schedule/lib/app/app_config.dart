import 'package:flutter/widgets.dart';
import 'package:office_schedule/app/core/configs/flavors/flavors.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final FlavorsType flavorsType;

  const AppConfig(
      {super.key,
      required this.appName,
      required this.flavorsType,
      required super.child});

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

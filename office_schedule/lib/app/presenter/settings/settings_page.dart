import 'package:flutter/material.dart';

import '../../core/theme/clinical_theme/app_colors.dart';
import '../../core/widgets/custom_base/custom_base.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomBase(
      statusBarIconIsDark: false,
      statusBarColor: AppColors.getTheme().dangerYellowDark,
      child: Container(),
    );
  }
}

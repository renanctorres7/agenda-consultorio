import 'package:flutter/material.dart';

import '../../core/theme/clinical_theme/app_colors.dart';
import '../../core/widgets/custom_base/custom_base.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return CustomBase(
      statusBarIconIsDark: false,
      statusBarColor: AppColors.getTheme().primaryDark,
      child: Container(),
    );
  }
}

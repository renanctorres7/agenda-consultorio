import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/clinical_theme/theme.dart';
import 'login_tab_bar.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(bottom: 46.0.h, top: 27.h),
        child: Text(
          'Agenda Clínica',
          style: ClinicalTextTypes.appTitleText,
        ),
      ),
      const LoginTabBar(),
    ]);
  }
}

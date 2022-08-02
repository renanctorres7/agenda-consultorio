import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/core/widgets/clinical_elevated_button/clinical_elevated_button.dart';

import 'core/theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: AppConfig.of(context).appName,
            home: Scaffold(
              appBar: AppBar(
                title: Text(
                  AppConfig.of(context).appName,
                  style: ClinicalTextTypes.bodyText,
                ),
              ),
              body: Center(
                child: ClinicalElevatedButton(
                    buttonColorEnum: ButtonColorEnum.secondary,
                    buttonText: 'entrar',
                    onPressed: () {}),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_input_date/clinical_form_input_date.dart';

import 'core/theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            locale: const Locale('pt', 'BR'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pt', 'BR'), // English
            ],
            title: AppConfig.of(context).appName,
            home: Scaffold(
                appBar: AppBar(
                  title: Text(
                    AppConfig.of(context).appName,
                    style: ClinicalTextTypes.bodyText,
                  ),
                ),
                body: Center(
                    child: SizedBox(
                        width: 350.w,
                        height: 285.h,
                        child: ClinicalFormInputDate(
                          textEditingController: textEditingController,
                        )))),
          );
        });
  }
}

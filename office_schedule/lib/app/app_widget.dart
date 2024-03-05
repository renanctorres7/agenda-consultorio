import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/core/core.dart';

import 'core/theme/clinical_theme/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  _initiliazeApp() async {
    // ClinicalIcons.loadImages();
    if (mounted) {
//      ClinicalImages.loadImages(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _initiliazeApp();
  }

  @override
  Widget build(BuildContext context) {
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
                body: const Center(
                  child: Text(Environments.baseUrl),
                )),
          );
        });
  }
}

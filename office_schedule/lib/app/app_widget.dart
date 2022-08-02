import 'package:flutter/material.dart';
import 'package:office_schedule/app/app_config.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context).appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppConfig.of(context).appName),
        ),
        body: Center(
          child: Text(AppConfig.of(context).appName),
        ),
      ),
    );
  }
}

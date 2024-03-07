import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  const StatusBarWidget({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: color,
            //  systemNavigationBarDividerColor: Colors.grey[100],
            systemNavigationBarIconBrightness: Brightness.light),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
              color: color,
              child: SafeArea(
                  child: Scaffold(backgroundColor: color, body: child))),
        ));
  }
}

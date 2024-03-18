import 'package:flutter/material.dart';

void callDialog({
  required BuildContext context,
  required Widget child,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: child);
      },
    );

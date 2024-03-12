import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';

AnsiPen info = AnsiPen()..blue(bold: true);
AnsiPen success = AnsiPen()..green(bold: true);
AnsiPen warning = AnsiPen()..yellow(bold: true);
AnsiPen error = AnsiPen()..red(bold: true);

void debugPrintSuccess(String message) {
  if (kDebugMode) {
    print(success(message));
  }
}

void debugPrintInfo(String message) {
  if (kDebugMode) {
    print(info(message));
  }
}

void debugPrintWarning(String message) {
  if (kDebugMode) {
    print(warning(message));
  }
}

void debugPrintError(String message) {
  if (kDebugMode) {
    print(error(message));
  }
}

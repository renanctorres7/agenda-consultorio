import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of(context, Languages);
  }

  /// APP CONFIG
  String get appName;

  /// LOGIN
  String get login;
  String get loginError;
  String get loginSuccess;
  String get loginButton;

  String get email;
  String get emailHint;
  String get password;
  String get passwordConfirm;
  String get forgotPassword;
  String get passwordHint;
  String get passwordConfirmHint;
  String get passwordConfirmError;
  String get emailError;
  String get passwordError;
  String get signUp;
  String get signUpButton;

  String get fullName;
  String get fullNameHint;

  String get fullNameError;

  String get phone;
  String get phoneHint;

  String get phoneError;

  String get specialty;
  String get specialtyHint;

  String get company;
  String get companyHint;
}

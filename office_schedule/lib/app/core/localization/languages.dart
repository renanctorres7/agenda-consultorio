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
  String get emailError;
  String get emailEmptyError;

  String get password;
  String get passwordConfirm;
  String get forgotPassword;
  String get passwordHint;
  String get passwordConfirmHint;
  String get passwordConfirmError;

  String get passwordError;
  String get passwordEmptyError;
  String get passwordErrorLength;

  String get signUp;
  String get signUpButton;
  String get signUpError;
  String get signUpSuccess;

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

  String get validationEmptyError;

  /// CLINICAL FORM

  String get createdBy;
  String get modifiedBy;
  String get notes;
  String get description;
  String get address;
  String get paymentType;
  String get paymentStatus;
  String get pacient;
  String get statusSchedule;
  String get clock;
  String get status;

  /// DIALOG ERROR

  String get dialogErrorTitle;
  String get dialogErrorButton;
  String get dialogErrorInitialMessage;

  /// DIALOG SUCCESS

  String get dialogSuccessTitle;

  /// API ERROR
  String get validationFailed;
  String get usernameAlreadyExists;

  /// CALENDAR
  String get month;
  String get week;
  String get day;
  String get today;

  /// WELCOME
  String get hello;
}

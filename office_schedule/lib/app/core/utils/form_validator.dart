import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return Languages.of(Get.context!).emailEmptyError;
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return Languages.of(Get.context!).emailError;
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return Languages.of(Get.context!).passwordEmptyError;
  }
  if (value.length < 6) {
    return Languages.of(Get.context!).passwordErrorLength;
  }
  return null;
}

String? passwordConfirmValidator(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return Languages.of(Get.context!).passwordEmptyError;
  }
  if (value != password) {
    return Languages.of(Get.context!).passwordConfirmError;
  }
  return null;
}

String? fullNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return Languages.of(Get.context!).fullNameHint;
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null) {
    return Languages.of(Get.context!).phoneHint;
  }

  if (value.length < 11) {
    return Languages.of(Get.context!).phoneError;
  }

  return null;
}

String? genericValidator(String? value) {
  if (value == null || value.isEmpty) {
    return Languages.of(Get.context!).validationEmptyError;
  }
  return null;
}

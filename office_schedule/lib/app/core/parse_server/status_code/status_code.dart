import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';

class ParseStatusCode {
  static getMessage(String statusCode) {
    switch (statusCode) {
      case '202':
        return Languages.of(Get.context!).usernameAlreadyExists;
      case '142':
        return Languages.of(Get.context!).validationFailed;
      case '101':
      default:
        return Languages.of(Get.context!).loginError;
    }
  }
}

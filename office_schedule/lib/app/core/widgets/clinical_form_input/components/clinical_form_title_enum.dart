import 'package:get/get.dart';
import 'package:office_schedule/app/core/icons/clinical_icons.dart';
import 'package:office_schedule/app/core/localization/languages.dart';

enum ClinicalFormTitleEnum {
  clock,
  company,
  fullName,
  createdBy,
  modifiedBy,
  email,
  password,
  passwordConfirm,
  notes,
  description,
  address,
  paymentType,
  paymentStatus,
  pacient,
  phone,
  specialty,
  statusSchedule
}

extension ClinicalFormTitleExtension on ClinicalFormTitleEnum {
  String get title {
    switch (this) {
      case ClinicalFormTitleEnum.clock:
        return Languages.of(Get.context!).clock;
      case ClinicalFormTitleEnum.company:
        return Languages.of(Get.context!).company;
      case ClinicalFormTitleEnum.fullName:
        return Languages.of(Get.context!).fullName;
      case ClinicalFormTitleEnum.createdBy:
        return Languages.of(Get.context!).createdBy;
      case ClinicalFormTitleEnum.modifiedBy:
        return Languages.of(Get.context!).modifiedBy;
      case ClinicalFormTitleEnum.email:
        return Languages.of(Get.context!).email;
      case ClinicalFormTitleEnum.password:
        return Languages.of(Get.context!).password;
      case ClinicalFormTitleEnum.passwordConfirm:
        return Languages.of(Get.context!).passwordConfirm;
      case ClinicalFormTitleEnum.notes:
        return Languages.of(Get.context!).notes;
      case ClinicalFormTitleEnum.description:
        return Languages.of(Get.context!).description;
      case ClinicalFormTitleEnum.address:
        return Languages.of(Get.context!).address;
      case ClinicalFormTitleEnum.paymentType:
        return Languages.of(Get.context!).paymentType;
      case ClinicalFormTitleEnum.paymentStatus:
        return Languages.of(Get.context!).paymentStatus;
      case ClinicalFormTitleEnum.pacient:
        return Languages.of(Get.context!).pacient;
      case ClinicalFormTitleEnum.phone:
        return Languages.of(Get.context!).phone;
      case ClinicalFormTitleEnum.specialty:
        return Languages.of(Get.context!).specialty;
      case ClinicalFormTitleEnum.statusSchedule:
        return Languages.of(Get.context!).statusSchedule;
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case ClinicalFormTitleEnum.clock:
        return ClinicalIcons.formClockGray;
      case ClinicalFormTitleEnum.company:
        return ClinicalIcons.formCompanyGray;
      case ClinicalFormTitleEnum.fullName:
        return ClinicalIcons.formPersonGray;
      case ClinicalFormTitleEnum.email:
        return ClinicalIcons.formEmailGray;
      case ClinicalFormTitleEnum.password:
      case ClinicalFormTitleEnum.passwordConfirm:
        return ClinicalIcons.formLockGray;
      case ClinicalFormTitleEnum.notes:
        return ClinicalIcons.formNotesGray;
      case ClinicalFormTitleEnum.paymentStatus:
        return ClinicalIcons.formPaymentGray;
      case ClinicalFormTitleEnum.phone:
        return ClinicalIcons.formPhoneGray;
      case ClinicalFormTitleEnum.specialty:
        return ClinicalIcons.formSpecialtyGray;
      case ClinicalFormTitleEnum.statusSchedule:
        return ClinicalIcons.formStatusScheduleGray;
      default:
        return '';
    }
  }
}

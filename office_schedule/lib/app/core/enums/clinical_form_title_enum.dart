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
    final result = switch (this) {
      ClinicalFormTitleEnum.clock => Languages.of(Get.context!).clock,
      ClinicalFormTitleEnum.company => Languages.of(Get.context!).company,
      ClinicalFormTitleEnum.fullName => Languages.of(Get.context!).fullName,
      ClinicalFormTitleEnum.createdBy => Languages.of(Get.context!).createdBy,
      ClinicalFormTitleEnum.modifiedBy => Languages.of(Get.context!).modifiedBy,
      ClinicalFormTitleEnum.email => Languages.of(Get.context!).email,
      ClinicalFormTitleEnum.password => Languages.of(Get.context!).password,
      ClinicalFormTitleEnum.passwordConfirm =>
        Languages.of(Get.context!).passwordConfirm,
      ClinicalFormTitleEnum.notes => Languages.of(Get.context!).notes,
      ClinicalFormTitleEnum.description =>
        Languages.of(Get.context!).description,
      ClinicalFormTitleEnum.address => Languages.of(Get.context!).address,
      ClinicalFormTitleEnum.paymentType =>
        Languages.of(Get.context!).paymentType,
      ClinicalFormTitleEnum.paymentStatus =>
        Languages.of(Get.context!).paymentStatus,
      ClinicalFormTitleEnum.pacient => Languages.of(Get.context!).pacient,
      ClinicalFormTitleEnum.phone => Languages.of(Get.context!).phone,
      ClinicalFormTitleEnum.specialty => Languages.of(Get.context!).specialty,
      ClinicalFormTitleEnum.statusSchedule =>
        Languages.of(Get.context!).statusSchedule,
    };
    return result;
  }

  String get icon {
    final result = switch (this) {
      ClinicalFormTitleEnum.clock => ClinicalIcons.formClockGray,
      ClinicalFormTitleEnum.company => ClinicalIcons.formCompanyGray,
      ClinicalFormTitleEnum.fullName => ClinicalIcons.formPersonGray,
      ClinicalFormTitleEnum.email => ClinicalIcons.formEmailGray,
      ClinicalFormTitleEnum.password ||
      ClinicalFormTitleEnum.passwordConfirm =>
        ClinicalIcons.formLockGray,
      ClinicalFormTitleEnum.notes => ClinicalIcons.formNotesGray,
      ClinicalFormTitleEnum.paymentStatus => ClinicalIcons.formPaymentGray,
      ClinicalFormTitleEnum.phone => ClinicalIcons.formPhoneGray,
      ClinicalFormTitleEnum.specialty => ClinicalIcons.formSpecialtyGray,
      ClinicalFormTitleEnum.statusSchedule =>
        ClinicalIcons.formStatusScheduleGray,
      _ => '',
    };
    return result;
  }
}

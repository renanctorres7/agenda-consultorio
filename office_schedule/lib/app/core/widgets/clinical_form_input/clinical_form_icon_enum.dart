import '../../icons/clinical_icons.dart';

enum ClinicalFormIconEnum {
  clock(ClinicalIcons.formClockGray),
  company(ClinicalIcons.formCompanyGray),
  fullName(ClinicalIcons.formPersonGray),
  email(ClinicalIcons.formEmailGray),
  lock(ClinicalIcons.formLockGray),
  notes(ClinicalIcons.formNotesGray),
  payment(ClinicalIcons.formPaymentGray),
  person(ClinicalIcons.formPersonGray),
  phone(ClinicalIcons.formPhoneGray),
  specialty(ClinicalIcons.formSpecialtyGray),
  statusSchedule(ClinicalIcons.formStatusScheduleGray);

  final String icon;
  const ClinicalFormIconEnum(this.icon);
}

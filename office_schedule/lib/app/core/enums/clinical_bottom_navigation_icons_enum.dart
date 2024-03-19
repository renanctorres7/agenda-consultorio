import 'package:office_schedule/app/core/icons/clinical_icons.dart';

enum ClinicalBottomNavigationIconsEnum {
  calendar(ClinicalIcons.menuCalendar, ClinicalIcons.menuCalendarFulFill),
  schedule(ClinicalIcons.menuNotes, ClinicalIcons.menuNotesFulfill),
  users(ClinicalIcons.menuUsers, ClinicalIcons.menuUsersFulfill),
  config(ClinicalIcons.menuSettings, ClinicalIcons.menuSettingsFulfill);

  final String iconInactive;
  final String iconActive;

  const ClinicalBottomNavigationIconsEnum(this.iconInactive, this.iconActive);
}

import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/debug_print_color/debug_print_color.dart';

const String _path = 'assets/svg';

class ClinicalIcons {
  static const String blueSearch = '$_path/blueSearch.svg';
  static const String cardClockBlack = '$_path/cardClockBlack.svg';
  static const String cardClockWhite = '$_path/cardClockWhite.svg';
  static const String dropdownCircleBlack = '$_path/dropdownCircleBlack.svg';
  static const String dropdownCircleWhite = '$_path/dropdownCircleWhite.svg';
  static const String formClockGray = '$_path/formClockGray.svg';
  static const String formCompanyGray = '$_path/formCompanyGray.svg';
  static const String formEmailGray = '$_path/formEmailGray.svg';
  static const String formLockGray = '$_path/formLockGray.svg';
  static const String formNotesGray = '$_path/formNotesGray.svg';
  static const String formPaymentGray = '$_path/formPaymentGray.svg';
  static const String formPersonGray = '$_path/formPersonGray.svg';
  static const String formPhoneGray = '$_path/formPhoneGray.svg';
  static const String formSpecialtyGray = '$_path/formSpecialtyGray.svg';
  static const String formStatusScheduleGray =
      '$_path/formStatusScheduleGray.svg';
  static const String menuCalendar = '$_path/menuCalendar.svg';
  static const String menuCalendarFulFill = '$_path/menuCalendarFulFill.svg';
  static const String menuNotes = '$_path/menuNotes.svg';
  static const String menuNotesFulfill = '$_path/menuNotesFulfill.svg';
  static const String menuSettings = '$_path/menuSettings.svg';
  static const String menuSettingsFulfill = '$_path/menuSettingsFulfill.svg';
  static const String menuUsers = '$_path/menuUsers.svg';
  static const String menuUsersFulfill = '$_path/menuUsersFulfill.svg';
  static const String schedulesCalendarWhite =
      '$_path/schedulesCalendarWhite.svg';

  static List<String> get _allIcons => [
        blueSearch,
        cardClockBlack,
        cardClockWhite,
        dropdownCircleBlack,
        dropdownCircleWhite,
        formClockGray,
        formCompanyGray,
        formEmailGray,
        formLockGray,
        formNotesGray,
        formPaymentGray,
        formPersonGray,
        formPhoneGray,
        formSpecialtyGray,
        formStatusScheduleGray,
        menuCalendar,
        menuCalendarFulFill,
        menuNotes,
        menuNotesFulfill,
        menuSettings,
        menuSettingsFulfill,
        menuUsers,
        menuUsersFulfill,
        schedulesCalendarWhite,
      ];

  static Future<void> loadImages() async {
    for (var icon in _allIcons) {
      var loader = SvgAssetLoader(icon);
      try {
        await svg.cache
            .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
      } catch (e) {
        debugPrintError(e.toString());
      }
    }
  }
}

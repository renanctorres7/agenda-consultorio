import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  static loadImages(BuildContext context) async {
    Future.wait([
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, blueSearch),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, cardClockBlack),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, cardClockWhite),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, dropdownCircleBlack),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, dropdownCircleWhite),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formClockGray),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, formCompanyGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formEmailGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formLockGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formNotesGray),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, formPaymentGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formPersonGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, formPhoneGray),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, formSpecialtyGray),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, formStatusScheduleGray),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, menuCalendar),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, menuCalendarFulFill),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, menuNotes),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, menuNotesFulfill),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, menuSettings),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, menuSettingsFulfill),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, menuUsers),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, menuUsersFulfill),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder, schedulesCalendarWhite),
          null),
    ]);
  }
}

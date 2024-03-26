import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  TabController? tabController;

  void changeCalendarTab(int index) {
    tabController?.index = index;
  }
}

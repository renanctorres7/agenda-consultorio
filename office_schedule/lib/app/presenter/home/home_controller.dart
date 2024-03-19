import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt bottomBarIndex = 0.obs;

  void changeBottomBarIndex(int index) {
    bottomBarIndex.value = index;
  }
}

import 'package:get/get.dart';
import 'package:wah_admin/infrastructure/dal/model/MainSide.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  var   selectedMenu = MainSide().obs;
  var demoMainSideList = [].obs;
  @override
  void onInit() {
    super.onInit();

    demoMainSideList.value = demoMainSide;
    selectedMenu.value = demoMainSideList.first;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

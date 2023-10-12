import 'package:get/get.dart';

class QuizController extends GetxController {
  //TODO: Implement QuizController

  final count = 0.obs;
  @override
  void onInit() {
    print("list");
    count.value = 0;
    super.onInit();
  }

  @override
  void onReady() {
    count.value = 0;
    super.onReady();
  }

  @override
  void onClose() {
    count.value = 4;
    super.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}

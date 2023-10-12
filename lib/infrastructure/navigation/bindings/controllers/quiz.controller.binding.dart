import 'package:get/get.dart';

import '../../../../presentation/quiz/controllers/quiz.controller.dart';

class QuizControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}

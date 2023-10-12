import 'package:get/get.dart';

import '../../../../presentation/task/controllers/task.controller.dart';

class TaskControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(
      () => TaskController(),
    );
  }
}

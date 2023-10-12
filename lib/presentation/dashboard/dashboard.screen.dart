import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:wah_admin/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
// import 'package:wah_admin/infrastructure/navigation/bindings/controllers/quiz.controller.binding.dart';
// import 'package:wah_admin/infrastructure/navigation/routes.dart';
import 'package:wah_admin/presentation/dashboard/widgets/sidebar.dart';
import 'package:wah_admin/presentation/quiz/controllers/quiz.controller.dart';
import 'package:wah_admin/presentation/screens.dart';
import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DashboardScreen'),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(
                flex: 1,
                child: Sidebar(
                  controller: controller,
                )),
            Expanded(
                flex: 4,
                child: Obx(() => showPage(
                    "${controller.selectedMenu.value.title}".toLowerCase())))
          ],
        ));
  }

  showPage(var title) {
    switch (title) {
      case "home":
        print('zero!');
        return HomeScreen(); // The switch statement must be told to exit, or it will execute every case.
      case "quiz":
        print('one!');
        Get.put(QuizController());
        return QuizScreen();
      case "task":
        print('two!');
        return TaskScreen();
      default:
        print(title);
        return Container();
    }
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/quiz.controller.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('QuizScreen'),
      //   centerTitle: true,
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.increment();
          },
          child: Obx(
            () => Text("${controller.count}"),
          )),
      body: const Center(
        child: Text(
          'QuizScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

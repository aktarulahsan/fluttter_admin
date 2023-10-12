import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/task.controller.dart';

class TaskScreen extends GetView<TaskController> {
  const TaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TaskScreen'),
      //   centerTitle: true,
      // ),
      body: const Center(
        child: Text(
          'TaskScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

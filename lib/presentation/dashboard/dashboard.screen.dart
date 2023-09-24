import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wah_admin/presentation/dashboard/widgets/sidebar.dart';
import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('DashboardScreen'),
        //   centerTitle: true,
        // ),
        body: Row(
      children: [
        Expanded(
            flex: 2,
            child: Sidebar(
              controller: controller,
            )),
        Expanded(flex: 4, child: Container())
      ],
    ));
  }
}

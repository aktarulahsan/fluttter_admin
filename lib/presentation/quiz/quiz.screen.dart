import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wah_admin/presentation/quiz/controllers/quiz.controller.dart';
import 'package:wah_admin/presentation/quiz/quistion/myQuestion.dart';
// import 'quiz_controller.dart'; // Assuming you have a QuizController

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getQuizList(); // Fetch quiz data when the screen is built
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.getQuizByid();
      //     controller.showHind(); // Trigger an action in the controller
      //   },
      //   child:
      //       Obx(() => Text("${controller.count}")), // Display controller count
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Container(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('status')),
                      DataColumn(label: Text('studentId')),
                      DataColumn(label: Text('examId')),
                      DataColumn(label: Text('mark')),
                      DataColumn(label: Text('passmark')),
                      DataColumn(label: Text('numberOfQuiz')),
                    ],
                    rows: controller.quizModelList.map((quiz) {
                      return DataRow(
                        cells: [
                          DataCell(Text(quiz.status!)),
                          DataCell(Text(quiz.studentId!)),
                          DataCell(Text(quiz.examId!)),
                          DataCell(Text('${quiz.mark!}')),
                          DataCell(Text('${quiz.passmark!}')),
                          DataCell(Text('${quiz.numberOfQuiz!}')),
                        ],
                        onSelectChanged: (value) => {
                          controller.showHind(),
                          controller.getQuizById(quiz.examId),
                        },
                      );
                    }).toList(),
                  ),
                )),

            Obx(() {
              return controller.show.value ? MyQuestion() : const SizedBox();
            }),

            // Wrap(
            //   children: [
            //     Obx(() {
            //       if (controller.show.value) {
            //         return Expanded(
            //           child: ListView(
            //             shrinkWrap: true,
            //             children: [
            //               SizedBox(
            //                 // Wrap Question widget with SizedBox to give it a specific height or let it determine its own height
            //                 height: MediaQuery.of(context)
            //                     .size
            //                     .height, // Set a specific height or you can set it to infinity to allow the Question widget to determine its own height
            //                 child: const Quistion(),
            //               ),
            //             ],
            //           ),
            //         );
            //       } else {
            //         return const SizedBox(); // Return an empty SizedBox if show is false
            //       }
            //     }),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

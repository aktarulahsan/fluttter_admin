import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wah_admin/infrastructure/theme/app_colors.dart';
import 'package:wah_admin/presentation/quiz/controllers/quiz.controller.dart';
import 'package:wah_admin/presentation/quiz/model/quizModel.dart';
import 'package:wah_admin/utill/app_utility_widget.dart';

class Quistion extends GetView<QuizController> {
  const Quistion({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getQuizByid();
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          bottom: 50,
          child: Obx(() => controller.quizModel.value.quizList != null
              ? ListView.builder(
                  itemCount: controller.quizModel.value.quizList?.length,
                  shrinkWrap: true,
                  // physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    QuizList quizListData =
                        controller.quizModel.value.quizList![index];
                    return question(
                        quizListData, index, quizListData.questionId);
                  },
                )
              : const SizedBox()),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: InkWell(
              onTap: () async {
                // print(controller.questionAns.value);
                // if (controller.questionAns.value > 0) {
                //   controller.quizModel.value.quizList;
                //   var result = await controller.submitQuizAnswer();
                //   if (result == 1) {
                //     Get.defaultDialog(
                //       backgroundColor: white,
                //       // content: Container(
                //       // decoration: const BoxDecoration(
                //       // image: DecorationImage(
                //       // image: AssetImage('assets/images/group184.png'), // Replace with your image asset path
                //       //   fit: BoxFit.cover,
                //       //   ),
                //       //   ),
                //       // ),
                //       barrierDismissible: false,
                //       title: ' ',
                //       titleStyle: const TextStyle(color: quizTextColor),
                //       content: Container(
                //         // decoration: const BoxDecoration(
                //         //   image: DecorationImage(
                //         //     image: AssetImage('assets/images/group184.png'),
                //         //     // Replace with your image asset path
                //         //     // fit: BoxFit.fitWidth,
                //         //   ),
                //         // ),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             // SizedBox(height: 30,),
                //             Center(
                //               child: Text(
                //                 'CONGRATULATIONS!',
                //                 style: AppUtility.quizHeader,
                //               ),
                //             ),

                //             const SizedBox(height: 5),
                //             Center(
                //               child: Text(
                //                 'You Have Successfully Completed Your Test!',
                //                 style: AppUtility.quizHeader,
                //               ),
                //             ),
                //             const SizedBox(height: 50),
                //             Text(
                //               "Your correct answer is: ",
                //               style: AppUtility.quizText,
                //             ),
                //             // Text(
                //             //   '${controller.ansModel.value.correctAnswerCount}/${controller.ansModel.value.totalQuestion}',
                //             //   style: AppUtility.quizHeader,
                //             // ),
                //             RichText(
                //               softWrap: true,
                //               textAlign: TextAlign.center,
                //               text: TextSpan(
                //                   text:
                //                       '${controller.ansModel.value.correctAnswerCount}',
                //                   style: const TextStyle(
                //                     fontFamily: "Poppins",
                //                     fontSize: 30,
                //                     fontWeight: FontWeight.bold,
                //                     color: Color(0xFF1C3C6B),
                //                   ),
                //                   children: [
                //                     TextSpan(
                //                       text:
                //                           '/${controller.ansModel.value.totalQuestion}',
                //                       style: const TextStyle(
                //                         fontFamily: "Poppins",
                //                         fontSize: 30,
                //                         fontWeight: FontWeight.bold,
                //                         color: Color(0xFF90C8EF),
                //                       ),
                //                     ),
                //                   ]),
                //             ),
                //           ],
                //         ),
                //       ),
                //       contentPadding: const EdgeInsets.all(10),
                //       actions: [
                //         ElevatedButton(
                //           onPressed: () {
                //             Get.back();
                //           },
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor: dreamBlue, elevation: 0),
                //           child: const Text(
                //             'back',
                //             style: TextStyle(color: generalWhite),
                //           ),
                //         )
                //       ],
                //     );
                //   } else {
                //     Get.defaultDialog(
                //       backgroundColor: white,
                //       barrierDismissible: false,
                //       title: 'Sorry you failed the exam?',
                //       titleStyle: const TextStyle(color: quizFailTextColor),
                //       content: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Center(
                //             child: Text(
                //               'Sorry you failed! Don\'t worry you can take the quiz again!',
                //               style: AppUtility.quizHeader,
                //             ),
                //           ),
                //           const SizedBox(height: 20),
                //           Text(
                //             "Your correct answer is: ",
                //             style: AppUtility.quizText,
                //           ),
                //           const SizedBox(height: 5),
                //           // Text(
                //           //   '${controller.ansModel.value.correctAnswerCount}/${controller.ansModel.value.totalQuestion}',
                //           //   style: AppUtility.quizHeader,
                //           // ),
                //           RichText(
                //             softWrap: true,
                //             textAlign: TextAlign.center,
                //             text: TextSpan(
                //                 text:
                //                     '${controller.ansModel.value.correctAnswerCount}',
                //                 style: const TextStyle(
                //                   fontFamily: "Poppins",
                //                   fontSize: 30,
                //                   fontWeight: FontWeight.bold,
                //                   color: Color(0xFF1C3C6B),
                //                 ),
                //                 children: [
                //                   TextSpan(
                //                     text:
                //                         '/${controller.ansModel.value.totalQuestion}',
                //                     style: const TextStyle(
                //                       fontFamily: "Poppins",
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.bold,
                //                       color: Color(0xFF90C8EF),
                //                     ),
                //                   ),
                //                 ]),
                //           ),
                //         ],
                //       ),
                //       contentPadding: const EdgeInsets.all(10),
                //       actions: [
                //         ElevatedButton(
                //           onPressed: () {
                //             Get.back();
                //           },
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor: dreamBlue, elevation: 0),
                //           child: const Text(
                //             'Retake',
                //             style: TextStyle(color: generalWhite),
                //           ),
                //         ),
                //       ],
                //     );
                //   }
                // } else {
                //   AppUtility.warningToast("You didn't answer");
                // }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                            "${controller.questionAns.value}/ ${controller.quizModel.value.quizList?.length ?? 0}",
                            style: AppUtility.quizHeader
                                .copyWith(color: generalWhite, fontSize: 20)),
                      ),
                      Text(
                        'Submit Quiz',
                        style: AppUtility.quizHeader
                            .copyWith(color: generalWhite, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                child: Obx(() => controller.isLoading == 1
                    ? CircularProgressIndicator()
                    : SizedBox()),
              ),
            ))
      ],
    );
  }

  Widget question(QuizList data, var index, var quizId) {
    // //print("quizId id is : ${quizId}  : ${data.givenAns}");
    return Column(
      children: [
        Text(
          "${parseHtmlString('Question ${index + 1}: ${data.question}')} ",
          style: AppUtility.headerTextStyle3,
        ),
        const SizedBox(
          height: 5,
        ),
        data.questionType == 1
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: data.options?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Option list = data.options![index];
                  return InkWell(
                    //highlightColor: Colors.red,
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      controller.selectdata(list, quizId, 1);
                    },
                    child: RadioItem(list, data.givenAns, index),
                  );
                })
            : ListView.builder(
                shrinkWrap: true,
                itemCount: data.options?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Option list = data.options![index];
                  return InkWell(
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      controller.selectMultiData(list, quizId, 2, data);
                    },
                    child: CheckBoxItem(list, data.givenAns, index),
                  );
                }),
        const SizedBox(
          height: 30,
          child: Text(""),
        )
      ],
    );
  }

  String parseHtmlString(String htmlString) {
    RegExp exp =
        RegExp(r"<[^>]*>|&nbsp;", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '').trim();
  }

  Widget RadioItem(Option? item, var givenAns, var index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${index + 1} ) ${item!.option}',
                    style: AppUtility.smallTextStyle3,
                  ),
                ),
              ),
              Container(
                height: 24.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Center(
                  child: item.optionId == givenAns
                      ? const Icon(
                          Icons.radio_button_checked,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.radio_button_unchecked),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 1,
            color: dividerColor2,
          )
        ],
      ),
    );
  }

  Widget CheckBoxItem(Option? item, var givenAns, var index) {
    List<String> selectedOptions = [];
    if (givenAns != null) {
      selectedOptions = givenAns.split(', ');
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    parseHtmlString('${index + 1} ) ${item!.option}'),
                    style: AppUtility.smallTextStyle3,
                  ),
                ),
              ),
              Container(
                height: 24.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Center(
                  child: selectedOptions.contains(item.optionId)
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.blue,
                        )
                      : const Icon(Icons.check_box_outline_blank),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
            color: dividerColor2,
          )
        ],
      ),
    );
  }
}

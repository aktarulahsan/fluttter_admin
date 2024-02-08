import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wah_admin/infrastructure/theme/app_colors.dart';
import 'package:wah_admin/presentation/quiz/controllers/quiz.controller.dart';
import 'package:wah_admin/presentation/quiz/model/quizModel.dart';
import 'package:wah_admin/utill/app_utility_widget.dart';

class MyQuestion extends GetView<QuizController> {
  // const MyQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.blueGrey[100],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question: What is the capital of France?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'A. London',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'B. Paris',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'C. Berlin',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'D. Rome',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
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

import 'package:get/get.dart';
import 'package:wah_admin/presentation/quiz/model/quizModel.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuizController extends GetxController {
  //TODO: Implement QuizController

  final count = 0.obs;

  final show = false.obs;
  final selectExamId = ''.obs;

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
  void showHind() => show.toggle();
  void selectID(id) => selectExamId(id);

  var examId = "".obs;
  var quizModel = QuizModel().obs;
  var quizModelTemp = QuizModel().obs;
  var questionAns = 0.obs;
  var isLoading = 0.obs;
  var courseId = "".obs;
  // var examId = "".obs;

  var quizModelList = <QuizModel>[].obs;

  Future<void> getQuizById(var quizId) async {
    quizModel.value = quizModelList.firstWhere(
        (element) => element.examId == quizId,
        orElse: () => QuizModel());
  }

  Future<void> getQuizList() async {
    // Quiz quiz = Quiz.fromJson(quizs);
    // examId.value = examIds;
    String jsonData =
        await rootBundle.loadString('json/quiz_json_data_list.json');
    // print("jsonData data is $jsonData");
    // Map<String, dynamic> quizDataList = json.decode(jsonData);

    quizModelList.value = quizModelFromJson(jsonData);
    // quizModelTemp.value = QuizModel.fromJson(quizDataList);
  }

  Future<void> selectdata(Option data, var questionId, var type) async {
    quizModel.value.quizList!
        .where((element) => element.questionId == questionId)
        .forEach((element) {
      element.givenAns = data.optionId;
      element.correctAnswer = data.answer;
    });
    questionAns.value = quizModel.value.quizList!
        .where((element) => element.givenAns != null)
        .length;
    if (questionAns.value == 1) {
      quizModel.value.examStartTime = DateTime.now().toString();
    }
    // print(questionAns.value);
    quizModel.refresh();
  }

  Future<void> selectMultiData(
      Option data, String questionId, int type, QuizList quizData) async {
    quizModel.value.quizList!
        .where((element) => element.questionId == questionId)
        .forEach((element) {
      // Get the list of selected optionIds
      List<String> selectedOptions = element.givenAns?.split(', ') ?? [];

      // Toggle the selection of the current optionId
      if (selectedOptions.contains(data.optionId)) {
        selectedOptions.remove(data.optionId);
      } else {
        selectedOptions.add(data.optionId!);
      }

      // Update the givenAns with the updated list
      element.givenAns = selectedOptions.join(', ');

      // Initialize correctAnswer as "1" (assuming it's correct)
      element.correctAnswer = "1";

      // Check each selected option to determine correctAnswer
      for (String selectedOptionId in selectedOptions) {
        Option? selectedOption = quizData.options!.firstWhere(
          (ele) => ele.optionId == selectedOptionId,
          orElse: () => Option(),
        );

        // If any selected option has answer "0", set correctAnswer to "0" and break
        if (selectedOption.answer == "0") {
          element.correctAnswer = "0";
          break;
        }
      }

      // If no options are selected, set correctAnswer to "0"
      if (selectedOptions.isEmpty) {
        element.correctAnswer = "0";
      }
    });

    // Calculate the number of selected answers
    // questionAns.value=0;
    questionAns.value = quizModel.value.quizList!
        .where((element) =>
            element.givenAns != null && element.givenAns!.isNotEmpty)
        .length;

    if (questionAns.value == 1) {
      quizModel.value.examStartTime = DateTime.now().toString();
    }

    quizModel.refresh();
  }
}

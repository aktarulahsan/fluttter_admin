import 'dart:convert';

List<QuizModel> quizModelFromJson(var str) =>
    List<QuizModel>.from(json.decode(str!).map((x) => QuizModel.fromJson(x)));

class QuizModel {
  String? status;
  int? statusCode;
  String? message;
  String? studentId;
  String? studentName;
  String? examId;
  dynamic mark;
  dynamic passmark;
  dynamic numberOfQuiz;
  String? examStartTime;
  String? examEndTime;
  List<QuizList>? quizList;

  QuizModel({
    this.status,
    this.statusCode,
    this.message,
    this.studentId,
    this.studentName,
    this.examId,
    this.mark,
    this.passmark,
    this.numberOfQuiz,
    this.examStartTime,
    this.examEndTime,
    this.quizList,
  });

  factory QuizModel.fromRawJson(String str) =>
      QuizModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        studentId: json["studentId"],
        studentName: json["studentName"],
        examId: json["examId"],
        mark: json["mark"],
        passmark: json["passmark"],
        numberOfQuiz: json["numberOfQuiz"],
        examStartTime: json["examStartTime"],
        examEndTime: json["examEndTime"],
        quizList: json["quizList"] == null
            ? []
            : List<QuizList>.from(
                json["quizList"]!.map((x) => QuizList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        "studentId": studentId,
        "studentName": studentName,
        "examId": examId,
        "mark": mark,
        "passmark": passmark,
        "numberOfQuiz": numberOfQuiz,
        "examStartTime": examStartTime,
        "examEndTime": examEndTime,
        "quizList": quizList == null
            ? []
            : List<dynamic>.from(quizList!.map((x) => x.toJson())),
      };
}

class QuizList {
  dynamic mark;
  String? examId;
  String? questionId;
  String? question;
  String? givenAns = "";
  String? correctAnswer = "";
  int? questionType;
  List<Option>? options;

  QuizList({
    this.mark,
    this.examId,
    this.questionId,
    this.question,
    this.givenAns,
    this.correctAnswer,
    this.questionType,
    this.options,
  });

  factory QuizList.fromRawJson(String str) =>
      QuizList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizList.fromJson(Map<String, dynamic> json) => QuizList(
        mark: json["mark"],
        examId: json["examId"],
        questionId: json["questionId"],
        question: json["question"],
        givenAns: json["givenAns"],
        correctAnswer: json["correctAnswer"],
        questionType: json["questionType"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mark": mark,
        "examId": examId,
        "questionId": questionId,
        "question": question,
        "givenAns": givenAns,
        "correctAnswer": correctAnswer,
        "questionType": questionType,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  String? optionId;
  String? questionId;
  dynamic option;
  dynamic answer;

  Option({
    this.optionId,
    this.questionId,
    this.option,
    this.answer,
  });

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionId: json["optionId"],
        questionId: json["questionId"],
        // option: optionEnumValues.map[json["option"]]!,
        option: json["option"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "optionId": optionId,
        "questionId": questionId,
        "option": optionEnumValues.reverse[option],
        "answer": answer,
      };
}

enum OptionEnum { FALSE, NOT_GIVEN, TRUE }

final optionEnumValues = EnumValues({
  "False": OptionEnum.FALSE,
  "Not Given": OptionEnum.NOT_GIVEN,
  "True": OptionEnum.TRUE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

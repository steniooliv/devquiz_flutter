import 'dart:convert';

import 'package:devquiz_flutter/shared/models/question_model.dart';

enum Level { easy, average, hard, expert }

extension LevelStringExt on String {
  Level get parse => {
        "easy": Level.easy,
        "average": Level.average,
        "hard": Level.hard,
        "expert": Level.expert
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.easy: "easy",
        Level.average: "average",
        Level.hard: "hard",
        Level.expert: "expert"
      }[this]!;
}

class QuizModel {
  final String title;
  final String image;
  final Level level;
  final List<QuestionModel> questions;
  final int questionAnswered;

  QuizModel({
    required this.title,
    required this.image,
    required this.level,
    this.questionAnswered = 0,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'level': level.parse,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      image: map['image'],
      level: map['level'].toString().parse,
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}

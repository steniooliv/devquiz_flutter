import 'package:devquiz_flutter/challenge/challenge_page.dart';
import 'package:devquiz_flutter/home/home_page.dart';
import 'package:devquiz_flutter/splash/spash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}

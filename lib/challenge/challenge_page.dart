import 'package:devquiz_flutter/challenge/controllers/challenge_controller.dart';
import 'package:devquiz_flutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz_flutter/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz_flutter/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz_flutter/result/result_page.dart';
import 'package:devquiz_flutter/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;
  final String title;

  ChallengePage({
    Key? key,
    required this.question,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    if (controller.currentPage < widget.question.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) {
      controller.answersRight++;
    }
    nextPage();
  }

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
            top: true,
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: value,
                lastPage: widget.question.length,
              ),
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.question
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => ValueListenableBuilder<int>(
                      valueListenable: controller.currentPageNotifier,
                      builder: (context, value, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (value != widget.question.length)
                            Expanded(
                              child: NextButtonWidget.white(
                                label: "Pular",
                                onTap: nextPage,
                              ),
                            ),
                          if (value == widget.question.length)
                            SizedBox(
                              width: 7,
                            ),
                          if (value == widget.question.length)
                            Expanded(
                              child: NextButtonWidget.green(
                                label: "Confirmar",
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => ResultPage(
                                        title: widget.title,
                                        answersLength: widget.question.length,
                                        answersCorrect: controller.answersRight,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    )),
          )),
    );
  }
}

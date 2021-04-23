import 'package:devquiz_flutter/challenge/challenge_page.dart';
import 'package:devquiz_flutter/core/core.dart';
import 'package:devquiz_flutter/home/controllers/home_controller.dart';
import 'package:devquiz_flutter/home/controllers/home_state.dart';
import 'package:devquiz_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz_flutter/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz_flutter/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifyer.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              "${e.questionAnswered} de ${e.questions.length}",
                          percent: e.questionAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ChallengePage(
                                        question: e.questions,
                                      )),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}

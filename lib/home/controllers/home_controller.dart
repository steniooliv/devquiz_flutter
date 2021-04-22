import 'package:devquiz_flutter/home/controllers/home_state.dart';
import 'package:devquiz_flutter/home/home_repository.dart';
import 'package:devquiz_flutter/shared/models/quiz_model.dart';
import 'package:devquiz_flutter/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifyer = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifyer.value = state;
  HomeState get state => stateNotifyer.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucess;
  }
}

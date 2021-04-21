import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão 4",
                style: AppTextStyles.body,
              ),
              Text(
                "de 10",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: 0.7)
        ],
      ),
    );
  }
}

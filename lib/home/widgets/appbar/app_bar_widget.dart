import 'package:devquiz_flutter/core/app_gradients.dart';
import 'package:devquiz_flutter/core/app_text_styles.dart';
import 'package:devquiz_flutter/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 260,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 180,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                          ),
                          TextSpan(
                            text: "Stenio",
                            style: AppTextStyles.titleBold,
                          ),
                          TextSpan(
                            text: "!",
                            style: AppTextStyles.titleBold,
                          ),
                        ],
                      )),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://github.com/steniooliv.png")),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.1),
                  child: ScoreCardWidget(),
                ),
              ],
            ),
          ),
        );
}

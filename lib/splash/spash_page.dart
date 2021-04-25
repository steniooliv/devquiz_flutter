import 'package:devquiz_flutter/core/app_gradients.dart';
import 'package:devquiz_flutter/core/app_images.dart';
import 'package:devquiz_flutter/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
            child: Image.asset(
          AppImages.logo,
        )),
      ),
    );
  }
}

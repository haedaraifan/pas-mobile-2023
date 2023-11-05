import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/splash_screen/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/iconG.png', width: 200, height: 200,),
            Image.asset('images/iconT.png', width: 300, height: 150,),
          ],
        ),
      ),
    );
  }
}
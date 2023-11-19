import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/splash_screen/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff48d861),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Brew",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xff070707)),),
            Text("Nook",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Color(0xff0f8924)),),
          ],
        ),
      ),
    );
  }
}
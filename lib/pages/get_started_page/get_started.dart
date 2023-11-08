import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/widget/button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50, bottom: 50),
        child: Container(
          width: size.width * 1,
          height: size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Brew",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff070707)),
                        ),
                        Text(
                          "Nook",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0f8924)),
                        ),
                      ],
                    ),
                    Container(
                        child: Text(
                      'Brewing Happiness, One Cup at a Time.',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                  ],
                ),
              ),
              Column(
                children: [
                  Button(
                    onPressed: () {
                      Get.toNamed(RouteName.login);
                    },
                    width: size.width * 1,
                    height: size.height * 0.08,
                    text: 'Sign in',
                    colorB: Color(0xff48d861),
                    colorT: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Button(
                      onPressed: () {
                        Get.toNamed(RouteName.register);
                      },
                      width: size.width * 1,
                      height: size.height * 0.08,
                      text: 'Sign up',
                      colorB: Color(0xfff1f1f1),
                      colorT: Color(0xff48d861))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

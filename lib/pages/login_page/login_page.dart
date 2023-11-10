import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/login_page/login_controller.dart';
import 'package:pas_mobile_2023/common/widget/button.dart';
import 'package:pas_mobile_2023/common/widget/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.find<LoginController>();
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      "Welcome back! Glad \nto see you, Again!",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Input(context, ctrUsername, "username", Icons.person, false),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Input(
                      context,
                      ctrPassword,
                      "Password",
                      Icons.lock,
                      true,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot your Password?",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Button(
                      text: "Sign in",
                      colorB: Color(0xff48d861),
                      colorT: Colors.white,
                      height: size.height * 0.07,
                      width: size.width * 1,
                      onPressed: () => loginController.loginAction(ctrUsername.text, ctrPassword.text),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 1,
                          decoration: BoxDecoration(color: Colors.black),
                        )),
                        Container(
                            margin: EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              "or sign in with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            )),
                        Expanded(
                            child: Container(
                          height: 1,
                          decoration: BoxDecoration(color: Colors.black),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black, width: 1)),
                            child: Image.asset(
                              "images/google.png",
                              width: 40,
                              height: 40,
                            ),
                          )),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black, width: 1)),
                            child: Image.asset(
                              "images/facebook.png",
                              width: 40,
                              height: 40,
                            ),
                          )),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black, width: 1)),
                            child: Image.asset(
                              "images/apple.png",
                              width: 40,
                              height: 40,
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don’t have account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xff48d861), fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => loginController.isLoading == true ?
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.4),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ) :
              const SizedBox()
            )
          ]
        ),
      ),
    );
  }
}
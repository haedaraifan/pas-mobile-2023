import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas_mobile_2023/widget/button.dart';
import 'package:pas_mobile_2023/widget/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController ctrUsername = TextEditingController();
    final TextEditingController ctrPassword = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Get.toNamed('/getStarted');
                }, icon: Icon(Icons.arrow_back,color: Colors.black,),color: Color(0xfff1f1f1),)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(
                        0xff48d861)),),
                    SizedBox(width: 5,),
                    Text("Back!",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                ),
                Text("Sign in to continue",style: TextStyle(fontSize: 18),),
                Input(hint: "Email", controller: ctrUsername, icon: Icon(Icons.person)),
                Input(hint: "Password", controller: ctrPassword, icon: Icon(Icons.lock)),
                SizedBox(height: size.height*0.025,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot your Password?",style: TextStyle(fontSize: 12),)
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Button(text: "Sign in", colorB: Color(0xff48d861), colorT: Colors.white, height: size.height*0.08, width: size.width*1, onPressed: () {
                  Get.toNamed('/home');
                },)
              ],
            )
          ],
        ),
      ),
    );
  }
}

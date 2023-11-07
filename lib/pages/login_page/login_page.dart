import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/login_page/login_controller.dart';
import 'package:pas_mobile_2023/common/widget/button.dart';
import 'package:pas_mobile_2023/common/widget/input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<LoginController>();
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: size.height*0.1,),
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
            SizedBox(height: size.height*0.2,),
            Input(hint: "Email", controller: ctrUsername, icon: Icon(Icons.person)),
            SizedBox(height: size.height*0.02,),
            Input(hint: "Password", controller: ctrPassword, icon: Icon(Icons.lock)),
            SizedBox(height: size.height*0.025,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot your Password?",style: TextStyle(fontSize: 12),)
              ],
            ),
            SizedBox(height: size.height*0.04,),
            Button(text: "Sign in", colorB: Color(0xff48d861), colorT: Colors.white, height: size.height*0.07, width: size.width*1, onPressed: () => loginController.loginAction(ctrUsername.text, ctrPassword.text)),
            SizedBox(height: size.height*0.04,),
            Row(
              children: [
                Expanded(child: Container(height: 1,decoration: BoxDecoration(color: Colors.black),)),
                Container(margin: EdgeInsets.only(left: 12,right: 12),child: Text("sign in with",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),)),
                Expanded(child: Container(height: 1,decoration: BoxDecoration(color: Colors.black),)),
              ],
            ),
            SizedBox(height: size.height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("images/google.png",width: 40,height: 40,),
              SizedBox(width: size.width*0.2,),
              Image.asset("images/facebook.png",width: 40,height: 40,),
            ],),
            SizedBox(height: size.height*0.08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don’t have account? ",style: TextStyle(fontSize: 16),),
                Text("Sign Up",style: TextStyle(color: Color(0xff48d861),fontSize: 16),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

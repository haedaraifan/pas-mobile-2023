import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import '../../common/widget/button.dart';
import '../../common/widget/input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController ctrUsername = TextEditingController();
    final TextEditingController ctrPassword = TextEditingController();
    final TextEditingController ctrConfrimPass = TextEditingController();
    final TextEditingController ctrEmail = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: size.width*1,
          height: size.height*1,
          child: Column(
            children: [
              SizedBox(height: size.height*0.04,),
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
              SizedBox(height: size.height*0.1,),
              Input(hint: "Email", controller: ctrEmail, icon: Icon(Icons.email)),
              SizedBox(height: size.height*0.02,),
              Input(hint: "Username", controller: ctrUsername, icon: Icon(Icons.person)),
              SizedBox(height: size.height*0.02,),
              Input(hint: "Password", controller: ctrPassword, icon: Icon(Icons.lock), ),
              SizedBox(height: size.height*0.02,),
              Input(hint: "Confrim Password", controller: ctrConfrimPass, icon: Icon(Icons.lock),),
              SizedBox(height: size.height*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot your Password?",style: TextStyle(fontSize: 12),)
                ],
              ),
              SizedBox(height: size.height*0.04,),
              Button(text: "Sign up", colorB: Color(0xff48d861), colorT: Colors.white, height: size.height*0.07, width: size.width*1, onPressed: () {
                Get.offNamed(RouteName.home);
              },),
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
                  Text("already have on account? ",style: TextStyle(fontSize: 16),),
                  Text("SIGN IN",style: TextStyle(color: Color(0xff48d861),fontSize: 16),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
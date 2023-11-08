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
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrConfrimPass = TextEditingController();
  final TextEditingController ctrEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width*1,
            height: size.height*1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.1,),
                  Text("Hello! Register to get started",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                  SizedBox(height: size.height*0.05,),
                  Input(context,ctrEmail,"Email", Icons.email,false,),
                  SizedBox(height: size.height*0.02,),
                  Input(context,ctrUsername,"Username",  Icons.person,false,),
                  SizedBox(height: size.height*0.02,),
                  Input(
                    context,
                    ctrPassword, "Password",
                    Icons.lock,
                    true,
                  ),
                  SizedBox(height: size.height*0.02,),
                  Input(context, ctrConfrimPass, "Confrim Password", Icons.lock, true,),
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
        ),
      ),
    );
  }
}


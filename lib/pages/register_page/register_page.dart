import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/register_page/register_controller.dart';
import '../../common/routes/route_name.dart';
import '../../common/widget/button.dart';
import '../../common/widget/input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = Get.find<RegisterController>();
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
        body: Stack(
          children: [
            SingleChildScrollView(
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
                      Input(context,ctrUsername,"Username",  Icons.person,false,),
                      SizedBox(height: size.height*0.02,),
                      Input(context,ctrEmail,"Email", Icons.email,false,),
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
                      SizedBox(height: size.height*0.02,),
                      Button(
                        text: "Sign up",
                        colorB: Color(0xff48d861),
                        colorT: Colors.white,
                        height: size.height*0.07,
                        width: size.width*1,
                        onPressed: () => registerController.registerAction(ctrUsername.text, ctrEmail.text, ctrPassword.text, ctrConfrimPass.text)
                      ),
                      SizedBox(height: size.height*0.02,),
                      Row(
                        children: [
                          Expanded(child: Container(height: 1,decoration: BoxDecoration(color: Colors.black),)),
                          Container(margin: EdgeInsets.only(left: 12,right: 12),child: Text("sign up with",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),)),
                          Expanded(child: Container(height: 1,decoration: BoxDecoration(color: Colors.black),)),
                        ],
                      ),
                      SizedBox(height: size.height*0.02,),
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
                      SizedBox(height: size.height*0.08,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("already have on account? ",style: TextStyle(fontSize: 16),),
                          GestureDetector(onTap:() => Get.offAllNamed(RouteName.login),child: Text("SIGN IN",style: TextStyle(color: Color(0xff48d861),fontSize: 16),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => registerController.isLoading == true ?
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.4),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ) :
              const SizedBox()
            ),
          ]
        ),
      ),
    );
  }
}


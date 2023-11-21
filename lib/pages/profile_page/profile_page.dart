import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas_mobile_2023/common/widget/item_profile.dart';
import 'package:pas_mobile_2023/pages/profile_page/profile_controller.dart';

import '../../common/widget/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final int currentIndex = 3;
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height *  0.04,),
              Text("Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.06,),
              CircleAvatar(
                foregroundImage: AssetImage("images/avatar.png"),
                radius: 70,
              ),
              Obx(() =>  Text(controller.username.value,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              Obx(() =>  Text("${controller.username.value}@gmail.com", style: TextStyle(fontSize: 22),)),
              SizedBox(height: size.height*0.05,),
              ItemProfile(text: "Settings", icon: Icons.settings, color: Colors.black),
              ItemProfile(text: "My Account", icon: Icons.person, color: Colors.black),
              ItemProfile(text: "Help Center", icon: Icons.help, color: Colors.black),
              ItemProfile(text: "Information", icon: Icons.info, color: Colors.black),
              GestureDetector(onTap:() => controller.signout(),child: ItemProfile(text: "Logout", icon: Icons.login, color: Colors.red)),
            ],
          ),
        ),
      ),
      bottomNavigationBar:bottomNavbar(context, currentIndex),
    );
  }
}

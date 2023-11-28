import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/widget/item_profile.dart';
import 'package:pas_mobile_2023/pages/profile_page/profile_controller.dart';

import '../../common/widget/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final int currentIndex = 3;
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height *  0.04,),
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: size.height*0.06,),
                const CircleAvatar(
                  foregroundImage: AssetImage(
                    "images/avatar.png"
                  ),
                  radius: 70,
                ),
                Obx(
                  () => Text(
                    profileController.userData.value.username,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Obx(
                  () => Text(
                    profileController.userData.value.email,
                    style: const TextStyle(
                      fontSize: 22
                    )
                  )
                ),
                SizedBox(height: size.height*0.05,),
                const ItemProfile(
                  text: "Settings",
                  icon: Icons.settings,
                  color: Colors.black
                ),
                const ItemProfile(
                  text: "My Account",
                  icon: Icons.person,
                  color: Colors.black
                ),
                const ItemProfile(
                  text: "Help Center",
                  icon: Icons.help,
                  color: Colors.black
                ),
                const ItemProfile(
                  text: "Information",
                  icon: Icons.info,
                  color: Colors.black
                ),
                GestureDetector(
                  onTap:() {
                    profileController.signout();
                  },
                  child: const ItemProfile(
                    text: "Logout",
                    icon: Icons.login,
                    color: Colors.red
                  )
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavbar(context, currentIndex),
    );
  }
}

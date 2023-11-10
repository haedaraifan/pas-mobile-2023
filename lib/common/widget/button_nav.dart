import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


Widget BottomNavbar(BuildContext context, RxInt currentIndex){
  return Obx(() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: GNav(
          color: Color(0xFF959595),
          backgroundColor: Colors.white,
          activeColor: Color(0xFF48D861),
          gap: 8,
          iconSize: 27,
          selectedIndex: currentIndex.value,
          // onTabChange: (index) {
          //   currentIndex.value = index; // Update the selected index
          //   switch (index) {
          //     case 0:
          //       Get.toNamed('/home');
          //       break;
          //     case 1:
          //       Get.toNamed('/favorite');
          //       break;
          //     case 2:
          //       Get.toNamed('/chart');
          //       break;
          //     case 3:
          //       Get.toNamed('/notif');
          //       break;
          //     default:
          //       break;
          //   }
          // },
          tabs: const [
            GButton(icon: Icons.home_filled, text: "home"),
            GButton(icon: Icons.search, text: "Seacrh"),
            GButton(icon: Icons.favorite, text: "favorites"),
            GButton(icon: Icons.person_2, text: "profile"),
          ],
        ),
      ),
    );
  });
}
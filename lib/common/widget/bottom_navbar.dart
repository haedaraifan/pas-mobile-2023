import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget bottomNavbar(BuildContext context, int currentIndex){
  Size size = MediaQuery.of(context).size;
  return GNav(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.05,
      vertical: size.width * 0.06
    ),
    color: const Color(0xFF959595),
    backgroundColor: Colors.white,
    activeColor: const Color(0xFF48D861),
    gap: 4,
    iconSize: size.width * 0.08,
    selectedIndex: currentIndex,
    onTabChange: (index) {
      currentIndex = index;
      switch (index) {
        case 0:
          Get.toNamed('/home');
          break;
        case 1:
          // Get.toNamed('/favorite');
          break;
        case 2:
          // Get.toNamed('/chart');
          break;
        case 3:
          Get.toNamed('/profile');
          break;
        default:
          break;
      }
    },
    tabs: const [
      GButton(icon: Icons.home_filled, text: "home"),
      GButton(icon: Icons.search, text: "search"),
      GButton(icon: Icons.favorite, text: "favorite"),
      GButton(icon: Icons.person_2, text: "profile"),
    ],
  );
}
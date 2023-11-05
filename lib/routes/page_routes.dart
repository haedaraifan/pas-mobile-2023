import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/getStarted.dart';
import 'package:pas_mobile_2023/pages/home_page.dart';
import 'package:pas_mobile_2023/pages/loginPage.dart';
import 'package:pas_mobile_2023/pages/splashScreen.dart';

List<GetPage> pageRoutes = [
  GetPage(
    name: "/splash",
    page: () => SplashScreen(),
  ),
  GetPage(
    name: "/getStarted",
    page: () => GetStarted(),
  ),
  GetPage(
    name: "/login",
    page: () => LoginPage(),
  ),
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),
];

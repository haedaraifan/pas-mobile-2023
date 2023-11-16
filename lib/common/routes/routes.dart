import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_page.dart';
import 'package:pas_mobile_2023/pages/register_page/register_binding.dart';
import 'package:pas_mobile_2023/pages/splash_screen/splash_binding.dart';
import 'package:pas_mobile_2023/pages/splash_screen/splash_screen.dart';
import 'package:pas_mobile_2023/pages/get_started_page/get_started.dart';
import 'package:pas_mobile_2023/pages/login_page/login_binding.dart';
import 'package:pas_mobile_2023/pages/login_page/login_page.dart';
import 'package:pas_mobile_2023/pages/register_page/register_page.dart';
import 'package:pas_mobile_2023/pages/home_page/home_binding.dart';
import 'package:pas_mobile_2023/pages/home_page/home_page.dart';

List<GetPage> pageRoutes = [
  GetPage(
    name: RouteName.splash,
    page: () => SplashScreen(),
    binding: SplashBinding()
  ),
  GetPage(
    name: RouteName.getStarted,
    page: () => GetStarted(),
  ),
  GetPage(
    name: RouteName.login,
    page: () => LoginPage(),
    binding: LoginBinding()
  ),
  GetPage(
    name: RouteName.register,
    page: () => RegisterPage(),
    binding: RegisterBinding()
  ),
  GetPage(
    name: RouteName.home,
    page: () => HomePage(),
    binding: HomeBinding()
  ),
];

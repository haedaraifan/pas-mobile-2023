import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/routes/route_name.dart';

class SplashController extends GetxController {
  late final SharedPreferences prefs;
  final int splashDuration = 4;

  @override
  void onInit() {
    super.onInit();
    checkSessionLogin();
  }

  void checkSessionLogin() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: splashDuration), () async {
      prefs.getBool("isLogin") == true ?
      Get.offNamed(RouteName.home) :
      Get.offNamed(RouteName.getStarted);
    });
  }
}
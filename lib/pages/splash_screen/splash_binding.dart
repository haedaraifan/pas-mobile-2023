import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
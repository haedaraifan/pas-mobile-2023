import 'package:get/get.dart';
import '../../common/routes/route_name.dart';

class SplashController extends GetxController {
  final int splashDuration = 4;

  @override
  void onInit() {
    super.onInit();
    delay();
  }

  void delay() {
    Future.delayed(Duration(seconds: splashDuration), () {
      Get.offNamed(RouteName.getStarted);
    });
  }
}
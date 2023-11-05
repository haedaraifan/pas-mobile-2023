import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/home_page/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
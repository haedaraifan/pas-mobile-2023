import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/login_page/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
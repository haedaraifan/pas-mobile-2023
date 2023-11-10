import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/register_page/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
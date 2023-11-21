import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/profile_page/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
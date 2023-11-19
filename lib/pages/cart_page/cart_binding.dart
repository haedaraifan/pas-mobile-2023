import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
import 'package:get/get.dart';
import '../../models/coffee_response_model.dart';

class ControllerCoffe extends GetxController {
  List<ProductResponseModel> cartItems = [];

  void addCart(ProductResponseModel item) {
    if (!cartItems.contains(item)) {
      // Tambahkan item ke keranjang
      cartItems.add(item);
      Get.snackbar('Success', 'Item added to cart');
    } else {
      Get.snackbar('Info', 'Item is already in the cart');
    }
  }
}

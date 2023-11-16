import 'package:get/get.dart';
import '../../common/models/coffee_response_model.dart';

class CartController extends GetxController {
  final List<ProductResponseModel> cartItems = <ProductResponseModel>[].obs;

  // Method to add an item to the cart
  void addToCart(ProductResponseModel item) {
    cartItems.add(item);
    update(); // Notify GetX that the data has changed
  }

  // Method to remove an item from the cart
  void removeFromCart(ProductResponseModel item) {
    cartItems.remove(item);
    update(); // Notify GetX that the data has changed
  }

  // Method to clear the entire cart
  void clearCart() {
    cartItems.clear();
    update(); // Notify GetX that the data has changed
  }

  // Method to get the total number of items in the cart
  int getCartItemCount() {
    return cartItems.length;
  }

  // Method to get the total price of items in the cart
  double getCartTotalPrice() {
    double total = 0.0;
    for (ProductResponseModel item in cartItems) {
      total += item.price;
    }
    return total;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/models/coffee_response_model.dart';

class CartController extends GetxController {
  RxList<ProductResponseModel> cartItemList = <ProductResponseModel>[].obs;
  RxBool isRefresh = false.obs;
  RxBool isDanaChecked = false.obs;
  RxBool isGopayChecked = false.obs;

  void changeDanaValue(bool value) {
    isDanaChecked.value = value;
    if (value) {
      isGopayChecked.value = false;
    }
  }

  void changeGopayValue(bool value) {
    isGopayChecked.value = value;
    if (value) {
      isDanaChecked.value = false;
    }
  }



  double updateTotalPrice(BuildContext context, double totalPrice){
    for (var item in cartItemList) {
      totalPrice += (item.price ?? 0.0) * (item.quantity ?? 1); // Calculate total price based on item prices and quantities
    }
    return totalPrice;
  }


  addToCart(BuildContext context, ProductResponseModel newItem) {
    bool isExisting = false;

    for (var item in cartItemList.value) {
      if (item.id == newItem.id) {
        isExisting = true;
        break;
      }
    }

    if (!isExisting) {
      cartItemList.value.add(newItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to cart.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This item is already in the cart.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  removeFromCart(BuildContext context, String id, String name) {
    cartItemList.value.removeWhere((item) => item.id == id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name telah dihapus dari keranjang.'),
        duration: Duration(seconds: 2),
      ),
    );

    isRefresh.value = !isRefresh.value;
  }

}


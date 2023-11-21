import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/models/coffee_response_model.dart';

class CartController extends GetxController {
  RxList<ProductResponseModel> cartItemList = <ProductResponseModel>[].obs;
  RxBool isRefresh = false.obs;
  RxBool isDanaChecked = false.obs;
  RxBool isGopayChecked = false.obs;
  RxDouble totalPrice = 0.0.obs;

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

  void updateTotalPrice() {
    double newTotalPrice = 0;
    for (var item in cartItemList) {
      newTotalPrice += item.price;
    }
    totalPrice.value = doubleFormatter(newTotalPrice);
  }

  ProductResponseModel updateItemPrice(ProductResponseModel item, int index, int? newQuantity) {
    double? currentPrice = item.price;
    int? quantity = item.quantity;
    double defaultPrice = currentPrice / quantity!;

    item.price = doubleFormatter(defaultPrice * newQuantity!);
    return item;
  }

  addToCart(BuildContext context, ProductResponseModel newItem) {
    bool isExisting = false;
    String message;

    for (var item in cartItemList) {
      if (item.id == newItem.id) {
        isExisting = true;
        break;
      }
    }

    if (!isExisting) {
      cartItemList.add(newItem);
      message = 'Item added to cart.';
    } else {
      message = 'This item is already in the cart.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );

    updateTotalPrice();
  }

  void removeFromCart(BuildContext context, ProductResponseModel product) {
    cartItemList.removeWhere((item) => item.id == product.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} has been removed from cart.'),
        duration: const Duration(seconds: 2),
      ),
    );

    isRefresh.value = !isRefresh.value;
    updateTotalPrice();
  }

  void increaseItemQuantity(ProductResponseModel item, int index) {
    int? newQuantity = item.quantity;
    if(newQuantity != null) newQuantity++;

    item = updateItemPrice(item, index, newQuantity);
    item.quantity = newQuantity;

    cartItemList[index] = item;
    updateTotalPrice();
  }

  void decreaseItemQuantity(ProductResponseModel item, int index) {
    if(item.quantity == 1) return;

    int? newQuantity = item.quantity;
    if(newQuantity != null) newQuantity--;

    item = updateItemPrice(item, index, newQuantity);
    item.quantity = newQuantity;

    cartItemList[index] = item;
    updateTotalPrice();
  }

  double doubleFormatter(double value) {
    String newValue = value.toStringAsFixed(2);
    return double.parse(newValue);
  }
}


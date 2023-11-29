import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';
import 'package:pas_mobile_2023/common/widget/cart_item_card.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({Key? key}) : super(key: key);

  Widget cartItemList() {
    return Obx(
          () => ListView.builder(
        itemCount: cartController.cartItemList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          ProductResponseModel item = cartController.cartItemList[index];
          return CartItemCard(
            item: item,
            onIncrement: () => cartController.increaseItemQuantity(item),
            onDecrement: () => cartController.decreaseItemQuantity(item),
            onRemove: () => cartController.removeFromCartWithConfirmation(context, item),
          );
        },
      ),
    );
  }

  Widget cartTotalPrice() {
    return Text(
      "\$${cartController.totalPrice}",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              "Cart",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            cartItemList(),
            SizedBox(height: size.height * 0.05),
            const Text(
              "Payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "images/dana.png",
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(child: Text("Dana")),
                    Obx(
                          () => Checkbox(
                        value: cartController.isDanaChecked.value,
                        onChanged: (bool? value) {
                          cartController.changeDanaValue(value ?? false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: size.width,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "images/gopay.png",
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(child: Text("Gopay")),
                    Obx(
                          () => Checkbox(
                        value: cartController.isGopayChecked.value,
                        onChanged: (bool? value) {
                          cartController.changeGopayValue(value ?? false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Text(
                "Total Price ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: cartTotalPrice(),
              ),
          GestureDetector(
            child: Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xff48d861),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: const Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18

                  ),
                  ),
                ),
              ),
          ),
            ],

          ),
        ),
      ),
    );
  }
}

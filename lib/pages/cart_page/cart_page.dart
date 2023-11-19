import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/widget/card_cart.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();


  CartPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Cart",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width,
                height: size.height*0.49,
                child: Obx(()=> cartController.isRefresh == true ?
                ListView.builder(
                  itemCount: cartController.cartItemList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CardCart(cartItem: cartController.cartItemList.value[index]);
                  },
                ) :
                ListView.builder(
                  itemCount: cartController.cartItemList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CardCart(cartItem: cartController.cartItemList.value[index]);
                    },
                ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "Payment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width,
                height: size.height * 0.1,
                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/dana.png",
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 10),
                          Text("Dana"),
                        ],
                      ),
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
                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/gopay.png",
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 10),
                          Text("Gopay"),
                        ],
                      ),
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
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height*0.1,
        decoration:
        BoxDecoration(
          color: Colors.white
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Total Price ", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  Obx(()=> cartController.isRefresh == true.obs ?
                  Text("\$${cartController.updateTotalPrice(context, totalPrice)}",style: TextStyle(color: Colors.black,fontSize: 30,),)
                      :Text("\$${cartController.updateTotalPrice(context, totalPrice)}",style: TextStyle(color: Colors.black,fontSize: 30),)),
                ],
              ),
          GestureDetector(
            child: Container(width: 140,height: 50,decoration: BoxDecoration(color: Color(
                0xff48d861),borderRadius: BorderRadius.circular(15)), child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18),))),
          )],
          ),
        ),
      ),
    );
  }
}

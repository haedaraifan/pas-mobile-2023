import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';
import 'package:pas_mobile_2023/common/widget/tambah.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_controller.dart';

class CardCart extends StatefulWidget {
  final CartController cartController = Get.put(CartController());
  final ProductResponseModel cartItem;

  CardCart({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  int counter = 1; // Initialize counter for quantity

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartItem = widget.cartItem;

    return Container(
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9), width: 3)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.27,
              width: size.width * 0.27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartItem.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cartItem.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    cartItem.description,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.6,
                    height: size.height * 0.05,
                    child: Container(
                      width: size.width * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Tambah(
                            counter: counter,
                            onCounterChanged: (value) {
                              setState(() {
                                counter = value; // Update the counter for quantity
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => widget.cartController.removeFromCart(context, cartItem.id, cartItem.name),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.close_rounded),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "\$${cartItem.price * counter}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

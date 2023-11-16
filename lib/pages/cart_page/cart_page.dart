import 'package:flutter/material.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';

class CartPage extends StatelessWidget {
  final List<ProductResponseModel> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text(cartItems[index].description),
          );
        },
      ),
    );
  }
}


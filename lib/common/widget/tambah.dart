import 'package:flutter/material.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';
import 'package:pas_mobile_2023/pages/cart_page/cart_controller.dart';



final CartController cartController = CartController();

class Tambah extends StatefulWidget {
  final int counter;
  final Function(int) onCounterChanged; // Callback to notify counter changes

  const Tambah({Key? key, required this.counter, required this.onCounterChanged})
      : super(key: key);

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add_circle, color: Color(0xff48d861)),
            onPressed: () {
              setState(() {
                _counter++; // Increase the counter when the button is pressed
                widget.onCounterChanged(_counter); // Notify the parent widget
              });
            },
          ),
          Container(
            width: 20,
            height: 20,
            child: Center(child: Text("$_counter")),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle, color: Color(0xff48d861)),
            onPressed: () {
              setState(() {
                if (_counter > 0) {
                  _counter--;
                  widget.onCounterChanged(_counter); // Notify the parent widget
                }
              });
            },
          ),
        ],
      ),
    );
  }
}


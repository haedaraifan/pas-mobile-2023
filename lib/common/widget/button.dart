import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final Color colorB;
  final Color colorT;
  final double height;
  final double width;
  final Function()? onPressed;

  const Button({
    required this.text,
    required this.colorB,
    required this.colorT,
    required this.height,
    required this.width,
    required this.onPressed

  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorB),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Set the border radius
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: colorT),
        ),
      ),
    );
  }
}

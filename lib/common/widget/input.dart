import 'package:flutter/material.dart';

Widget Input(BuildContext context, TextEditingController controller,
    String hint, IconData icon1, bool obsT) {
  return TextField(
    controller: controller,
    obscureText: obsT,
    decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon1),
        filled: true,
        fillColor: Color(0xffe8ecf4),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))),
  );
}

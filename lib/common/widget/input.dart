import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  const Input({
    required this.hint,
    required this.controller,
    required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black,)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        )
      ),
    );
  }
}

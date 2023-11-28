import 'package:flutter/material.dart';

Widget loginIconButton(String icon, Function()? onTab) {
  return GestureDetector(
    onTap: onTab,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1)),
      child: Image.asset(
        icon,
        width: 40,
        height: 40,
      ),
    ),
  );
}
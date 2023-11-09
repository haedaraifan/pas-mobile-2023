import 'package:flutter/material.dart';
import '../../common/widget/coffe_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ini App Bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 20,left: 10,right: 10),
        child: ListView(
          children: [
            Container(
                height: size.height * 0.58,
                child: ListView( children: [coffeeList(context)],
                )),
          ],
        ),
      ),
    );
  }
}
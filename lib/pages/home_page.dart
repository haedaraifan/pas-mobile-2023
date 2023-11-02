import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/controllers/example_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ExampleController _controller = Get.put(ExampleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.appBarTitle.value),
      ),
      body: Center(
        child: Text(_controller.content.value),
      ),
    );
  }
}
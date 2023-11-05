import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/pages/home_page/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.find<HomeController>();

  Widget coffeeList() {
    return Obx(() => homeController.isLoading.value ?
      const Center(
        child: CircularProgressIndicator()
      ) :
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        shrinkWrap: true,
        itemCount: homeController.coffeResponseModel.length,
        itemBuilder: (context, index) {
          final product = homeController.coffeResponseModel[index];
          return Container(
            color: Colors.green[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(product.imageUrl),
                  Text(product.name),
                  Text("\$${product.price}")
                ],
              ),
            ),
          );
        }
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ini App Bar"),
      ),
      body: coffeeList(),
    );
  }
}
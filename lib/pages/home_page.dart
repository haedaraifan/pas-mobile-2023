import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/controllers/coffee_list_controller.dart';
import 'package:pas_mobile_2023/controllers/example_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExampleController _controller = Get.put(ExampleController());
  final CoffeeListController coffeeListController = Get.put(CoffeeListController());

  Widget coffeeList() {
    return Obx(() => coffeeListController.isLoading.value ?
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
        itemCount: coffeeListController.coffeResponseModel.length,
        itemBuilder: (context, index) {
          final product = coffeeListController.coffeResponseModel[index];
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
        title: Text(_controller.appBarTitle.value),
      ),
      body: coffeeList(),
    );
  }
}
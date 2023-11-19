import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/widget/button_nav.dart';
import 'package:pas_mobile_2023/common/widget/home_discount_list.dart';
import 'package:pas_mobile_2023/pages/home_page/home_controller.dart';
import '../../common/widget/home_coffee_list.dart';
import 'home_shimmer_loading.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final RxInt currentIndex = 0.obs;

  HomePage({Key? key});

  Widget homeCompletedLoading(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Brew",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Nook",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0f8924)),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(RouteName.cart);
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                hintText: "Search...",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                filled: true,
                fillColor: Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.search_outlined)),
            style: TextStyle(fontSize: 15, color: Colors.black),
            cursorColor: Colors.black,
            cursorHeight: 24,
            cursorWidth: 1,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {},
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: homeDiscountList(
                context, homeController.getDiscountProduts(4))),
        homeCoffeeList(homeController.coffeResponseModel),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => homeController.isLoading == true
            ? homeShimmerLoading(context)
            : homeCompletedLoading(context),
      ),
      bottomNavigationBar: BottomNavbar(context, currentIndex),
    );
  }
}

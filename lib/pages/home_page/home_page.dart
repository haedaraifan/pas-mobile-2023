import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/widget/bottom_navbar.dart';
import 'package:pas_mobile_2023/common/widget/home_discount_list.dart';
import 'package:pas_mobile_2023/common/widget/roast_level_selector.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/widget/home_coffee_list.dart';
import 'package:pas_mobile_2023/pages/home_page/home_controller.dart';
import 'home_shimmer_loading.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final int currentIndex = 0;

  HomePage({super.key});

  Widget roastLevel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Roast level",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            )
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.width *  0.1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () => homeController.selectRoastLevel(index),
                  child: RoastLevelSelector(
                    index: index,
                    isSelected: homeController.selectedRoastLevel == index,
                  ),
                )
              );
            }
          ),
        )
      ]
    );
  }

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
          child: homeDiscountList(context, homeController.getDiscountProduts(4))
        ),
        roastLevel(context),
        homeCoffeeList(
          homeController.sortProductByRoastLevel(
            homeController.coffeResponseModel,
            homeController.selectedRoastLevel.value
          )
        )
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
      bottomNavigationBar: bottomNavbar(context, currentIndex),
    );
  }
}

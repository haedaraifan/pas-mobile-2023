import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pas_mobile_2023/common/widget/button_nav.dart';
import 'package:pas_mobile_2023/common/widget/diskon_list.dart';
import 'package:pas_mobile_2023/pages/detail_product/detail_page.dart';
import '../../common/widget/coffe_item.dart';

class HomePage extends StatelessWidget {
  final RxInt currentIndex = 0.obs;
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 20, left: 10, right: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Draw",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 40,
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Search..",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            DiskonList(context),
            SizedBox(height: size.height*0.05,),
            Container(
                height: size.height * 0.58,
                child: ListView(
                  children: [coffeeList(context)],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(context, currentIndex),
    );
  }
}

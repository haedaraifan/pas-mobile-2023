import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas_mobile_2023/pages/detail_product/detail_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../pages/home_page/home_controller.dart';


final homeController = Get.find<HomeController>();

Widget coffeeList(BuildContext context) {
  final lebar = MediaQuery.of(context).size.width;
  return Obx(() => homeController.isLoading.value ?
  const Center(
      child: CircularProgressIndicator()
  ) :
  Center(
    child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: List.generate(homeController.coffeResponseModel.length, (index) {
          final product = homeController.coffeResponseModel[index];
          return GestureDetector(
            onTap: () {
              Get.to(DetailPage(img: product.imageUrl, name: product.name, price: product.price, desc: product.description, rate: product.roastLevel));
            },
            child: Container(
              width: lebar * 0.45,
              height: lebar * 0.59,
              decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 200,
                      height: 135,
                      child: Image.network(
                        product.imageUrl,
                        width: 200,
                        height: 135,
                        fit: BoxFit.cover, // Adjust the fit based on your requirements
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                        Container( width:100 ,child: Text(product.description,style: TextStyle( fontSize: 11, ),overflow: TextOverflow.ellipsis,)),
                        SizedBox(height: 2.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${product.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xff00512d),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        })
    ),
  ));
}

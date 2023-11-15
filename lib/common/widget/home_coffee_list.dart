import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/detail_product/detail_page.dart';
import '../models/coffee_response_model.dart';

Widget homeCoffeeListItem(BuildContext context, ProductResponseModel item) {
  return GestureDetector(
    onTap: () => Get.to(DetailPage(product: item)),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(14)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(item.imageUrl)
            ),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              overflow: TextOverflow.ellipsis
            ),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 11
              ),
              overflow: TextOverflow.ellipsis
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.width * 0.08,
                  decoration: const BoxDecoration(
                    color: Color(0xff00512d),
                    borderRadius:
                    BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget homeCoffeeList(List<ProductResponseModel> itemList) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1 / 1.3
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemCount: itemList.length,
    itemBuilder: (context, index) {
      return homeCoffeeListItem(context, itemList[index]);
    }
  );
}
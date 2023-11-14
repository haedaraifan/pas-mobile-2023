import 'package:flutter/material.dart';
import '../models/coffee_response_model.dart';

final List<Map<String, dynamic>> fakeProducts  = [
  {
    'text': 'Discount Sales',
    'desc': 'Get up to 50% off with code 190411. Limited time only!',
  },
  {
    'text': 'Student discount.',
    'desc': 'Get up to 55% off by entering your NISN. Limited-time offer!',
  },
  {
    'text': 'Loyalty Card',
    'desc': 'Get 1 free coffee after making over 4 purchases.',
  },
  {
    'text': 'Rainy Day Special',
    'desc': 'During rain, enjoy a 20% discount on all hot beverages.',
  },
];

Widget homeDiscountList(BuildContext context, List<ProductResponseModel> products) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    height: size.width * 0.44,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: size.width * 0.8,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  child: Image.network(
                    products[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff48d861),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: Text(
                          fakeProducts[index]['text'],textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.01),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Text(
                        fakeProducts[index]["desc"],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    ),
  );
}

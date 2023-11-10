import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> items = [
  {
    'image': 'images/coffea.webp',
    'text': 'Discount Sales',
    'berlaku': 'Applies on Monday.',
    'desc': 'Get up to 50% off with code 190411. Limited time only!',
  },
  {
    'image': 'images/coffeb.webp',
    'text': 'Student discount.',
    'berlaku': 'Applies on Friday',
    'desc': 'Get up to 55% off by entering your NISN. Limited-time offer!',
  },
  {
    'image': 'images/coffec.webp',
    'text': 'Loyalty Card',
    'berlaku': 'Applies after 4+ purchases.',
    'desc': 'Get 1 free coffee after making over 4 purchases.',
  },
  {
    'image': 'images/coffed.webp',
    'text': 'Rainy Day Special',
    'berlaku': 'Applies on rainy days.',
    'desc': 'During rain, enjoy a 20% discount on all hot beverages.',
  },
];

Widget DiskonList(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Row(
    children: [
      Container(
        width: size.width*0.9,
        height: size.height * 0.2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length ,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: size.width*0.8,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(items[index]["image"]),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start, // Adjusted alignment
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height*0.02,),
                          Container(
                            width: size.width * 0.25,
                            height: size.height * 0.025,
                            decoration: BoxDecoration(
                              color: Color(0xff48d861),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                items[index]['text'],textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: size.width * 0.01), // Reduced spacing
                          Container(
                            width: size.width * 0.4,
                            child: Text(
                              items[index]["desc"],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height* 0.03,),
                          Container(
                            width: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(items[index]['berlaku'], style: TextStyle(fontSize: 10),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),

    ],
  );
}

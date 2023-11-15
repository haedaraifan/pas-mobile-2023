import 'package:flutter/material.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';

class DetailPage extends StatelessWidget {
  final ProductResponseModel product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(product.imageUrl)),
                ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "% On Sale",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4.${product.roastLevel}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(width: 70, height: 35,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black,width: 1)),
                    child: Center(child: Text("Roast ${product.roastLevel}",style: TextStyle(fontWeight: FontWeight.bold),))
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width,
                  child: Text(
                    product.description,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Center(child: Text("\$${product.price}",style: TextStyle(fontSize: 40),))),
              SizedBox(width: size.width*0.15,),
              Container(width: 140,height: 50,decoration: BoxDecoration(color: Color(
                  0xff48d861),borderRadius: BorderRadius.circular(15)), child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18),)))
            ],
          ),
        ),
      ),
    );
  }
}

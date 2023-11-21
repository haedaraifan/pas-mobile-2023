import 'package:flutter/material.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';

class CartItemCard extends StatelessWidget {
  final ProductResponseModel item;
  final Function() onIncrement;
  final Function() onDecrement;
  final Function() onRemove;
  
  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD9D9D9),
            width: 3
          )
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.width * 0.27,
              width: size.width * 0.27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 15
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.3,
                    height: size.width * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Color(0xff48d861)
                          ),
                          onPressed: onIncrement,
                        ),
                        Center(
                          child: Text(
                            item.quantity.toString(),
                            style: const TextStyle(
                              fontSize: 18
                            ),
                          )
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Color(0xff48d861)
                          ),
                          onPressed: onDecrement,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.close_rounded),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
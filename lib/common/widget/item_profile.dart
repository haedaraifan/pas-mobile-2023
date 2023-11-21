import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const ItemProfile({Key? key,required this.text, required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.08,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Icon(icon,size: 40,color: color,),
                SizedBox(width: size.width*0.05,),
                Text(text,style: TextStyle(fontSize: 25,color: color),),
              ],
            ),

            Container(
              height: size.height*0.06,
              width: size.height*0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black,)
              ),
              child: Center(
                child: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}

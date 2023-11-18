import 'package:flutter/material.dart';

class RoastLevelSelector extends StatelessWidget {
  final int index;
  final bool isSelected;
  
  const RoastLevelSelector({
    super.key,
    required this.index,
    required this.isSelected,
  });

  BoxDecoration selectedBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFF48D861),
      borderRadius: BorderRadius.circular(8)
    );
  }

  BoxDecoration unselectedBoxDecoration() {
    return BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        width: 1.8
      ),
      borderRadius: BorderRadius.circular(8)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width *  0.2,
      decoration: isSelected ?
        selectedBoxDecoration() :
        unselectedBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            index == 0 ? "All" : index.toString(),
            style: TextStyle(
              color: isSelected ?
                Colors.white :
                Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500
            )
          )
        ),
      ),
    );
  }
}
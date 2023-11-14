import 'package:flutter/material.dart';
import '../../common/widget/shimmer_loading.dart';

Widget homeShimmerLoading(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerLoading.box(size.width * 0.4, size.width * 0.1),
            ShimmerLoading.box(size.width * 0.1, size.width * 0.1),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: ShimmerLoading.box(double.infinity, size.width * 0.12),
      ),
      SizedBox(
        height: size.width * 0.36,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ShimmerLoading.boxWithChild(
                size.width * 0.8,
                double.infinity,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ShimmerLoading.text(size.width * 0.3, double.infinity),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading.text(size.width * 0.26, size.width * 0.04),
                          ShimmerLoading.text(size.width * 0.4, size.width * 0.05),
                          ShimmerLoading.text(size.width * 0.4, size.width * 0.05),
                          ShimmerLoading.text(size.width * 0.32, size.width * 0.05),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.3
        ),
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        itemBuilder: (context, index) {
          return ShimmerLoading.boxWithChild(
            double.infinity,
            double.infinity,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoading.text(size.width, size.width * 0.34),
                  ShimmerLoading.text(size.width * 0.3, size.width * 0.06),
                  ShimmerLoading.text(size.width * 0.4, size.width * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerLoading.text(size.width * 0.2, size.width * 0.06),
                      ShimmerLoading.text(size.width * 0.08, size.width * 0.08),
                    ],
                  )
                ],
              ),
            )
          );
        }
      )
    ],
  );
}
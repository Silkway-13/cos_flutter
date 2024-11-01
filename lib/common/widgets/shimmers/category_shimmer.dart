import 'package:cos_work_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosCategoryShimmer extends StatelessWidget {
  const CosCategoryShimmer({
    Key? key,
    this.itemCount = 6,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CosShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: CosSizes.spaceBtwItems / 2,
              ),
              CosShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}

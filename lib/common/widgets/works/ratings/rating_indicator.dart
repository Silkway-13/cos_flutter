import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CosRatingBarIndicator extends StatelessWidget {
  const CosRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: CosColors.grey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: CosColors.primary,
            ));
  }
}

import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/locations/location_card.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosLocationShowcase extends StatelessWidget {
  const CosLocationShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CosRoundedContainer(
      showBorder: true,
      borderColor: CosColors.darkGrey,
      padding: const EdgeInsets.all(CosSizes.sm),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: CosSizes.spaceBtwItems),
      child: Column(
        children: [
          /// location with Work Count
          const CosLocationCard(showBorder: true),

          /// location top 3 Work Images
          Row(
              children: images
                  .map((image) => locationTopWorkImageWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }
}

Widget locationTopWorkImageWidget(String image, context) {
  return Expanded(
    child: CosRoundedContainer(
      heigth: 100,
      backgroundColor: CosHelperFunctions.isDarkMode(context)
          ? CosColors.darkerGrey
          : CosColors.light,
      margin: const EdgeInsets.only(right: CosSizes.sm),
      padding: const EdgeInsets.all(CosSizes.md),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}

import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/common/widgets/images/cos_rounded_image.dart';
import 'package:cos_work_store/common/widgets/texts/cos_location_title_with_loc_icon.dart';
import 'package:cos_work_store/common/widgets/texts/work_title_text.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_price_text.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosWorkCardHorizontal extends StatelessWidget {
  const CosWorkCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CosSizes.workImageRadius),
        color: dark ? CosColors.darkerGrey : CosColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          CosRoundedContainer(
            heigth: 120,
            padding: const EdgeInsets.all(CosSizes.sm),
            backgroundColor: dark ? CosColors.dark : CosColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: CosRoundedImage(
                    imageUrl: CosImages.workImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: CosRoundedContainer(
                    radius: CosSizes.sm,
                    backgroundColor: CosColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: CosSizes.sm, vertical: CosSizes.xs),
                    child: Text(
                      '10%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: CosColors.black),
                    ),
                  ),
                ),

                /// -- Interested Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CosCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          /// Details
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: CosSizes.sm, left: CosSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CosWorkTitleText(
                        title: 'Хувь айлын обой наах',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: CosSizes.spaceBtwItems / 2,
                      ),
                      CosLocationTitleWidthLocationIcon(title: 'Зайсан'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: CosWorkPriceText(price: '5000')),

                      /// Add to cart

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: CosColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(CosSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(CosSizes.workImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: CosSizes.iconLg * 1.2,
                          height: CosSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: CosColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

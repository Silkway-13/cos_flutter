import 'package:cos_work_store/common/styles/shadows.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/common/widgets/images/cos_rounded_image.dart';
import 'package:cos_work_store/common/widgets/texts/cos_location_title_with_loc_icon.dart';
import 'package:cos_work_store/common/widgets/texts/work_title_text.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_price_text.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/work_detail.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CosWorkCardVertical extends StatelessWidget {
  const CosWorkCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    /// Container with side padding, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => const WorkDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CosShadowStyle.verticalWorkShadow],
          borderRadius: BorderRadius.circular(CosSizes.workImageRadius),
          color: dark ? CosColors.darkerGrey : CosColors.white,
        ),
        child: Column(
          children: [
            /// -- Thumbnail, WishList Button, Discount Tag
            CosRoundedContainer(
              heigth: 180,
              padding: const EdgeInsets.all(CosSizes.sm),
              backgroundColor: dark ? CosColors.dark : CosColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const CosRoundedImage(
                    imageUrl: CosImages.workImage1,
                    applyImageRadius: true,
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
                        '25%',
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
            const SizedBox(
              height: CosSizes.spaceBtwItems / 2,
            ),

            /// -- Details
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: CosSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CosWorkTitleText(
                      title: "Синглэ хаусны шавар",
                      smallSize: true,
                    ),
                    SizedBox(
                      height: CosSizes.spaceBtwItems / 2,
                    ),
                    CosLocationTitleWidthLocationIcon(
                      title: "Арцатын ам",
                    ),
                  ],
                ),
              ),
            ),

            // Todo: Add Spacer()
            const Spacer(),

            /// -- Price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: CosSizes.sm),
                  child: CosWorkPriceText(
                    price: "20000",
                  ),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: CosColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(CosSizes.cardRadiusMd),
                      bottomRight: Radius.circular(CosSizes.workImageRadius),
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
            ),
          ],
        ),
      ),
    );
  }
}

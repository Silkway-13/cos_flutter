import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/images/cos_circular_image.dart';
import 'package:cos_work_store/common/widgets/texts/cos_location_title_with_loc_icon.dart';
import 'package:cos_work_store/common/widgets/texts/work_title_text.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_price_text.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/enums.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosWorkMetaData extends StatelessWidget {
  const CosWorkMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price
        Row(
          children: [
            CosRoundedContainer(
              radius: CosSizes.sm,
              backgroundColor: CosColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: CosSizes.sm, vertical: CosSizes.xs),
              child: Text(
                '25% нь хийгдсэн',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: CosColors.black),
              ),
            ),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),

            /// Price

            // Text(
            //   '₮18000',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleSmall!
            //       .apply(decoration: TextDecoration.lineThrough),
            // ),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),
            const CosWorkPriceText(
              price: '29000',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        const CosWorkTitleText(title: 'Синглэ хаусны шавар'),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 1.5,
        ),

        /// Description
        Row(
          children: [
            const CosWorkTitleText(title: 'Тайлбар: '),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),
            Flexible(
              child: Text(
                'Өндөр ханатай ихэнхдээ бетон ханатай синглэ хаусны дотор шаврын ажил бүрэн хийж гүйцэтгэнэ.',
                style: Theme.of(context).textTheme.titleMedium!,
                overflow: TextOverflow.ellipsis,
                maxLines: 5, // Adjust as needed
              ),
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 1.5,
        ),

        /// Location
        Row(
          children: [
            CosCircularImage(
              image: CosImages.workImage1,
              width: 32,
              height: 32,
              overlayColor: dark ? CosColors.white : CosColors.black,
            ),
            const CosLocationTitleWidthLocationIcon(
              title: 'Яармаг',
              locationTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

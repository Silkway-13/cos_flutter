import 'package:cos_work_store/common/widgets/images/cos_rounded_image.dart';
import 'package:cos_work_store/common/widgets/texts/cos_location_title_with_loc_icon.dart';
import 'package:cos_work_store/common/widgets/texts/work_title_text.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosCartItem extends StatelessWidget {
  const CosCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        CosRoundedImage(
          imageUrl: CosImages.workImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CosSizes.sm),
          backgroundColor: CosHelperFunctions.isDarkMode(context)
              ? CosColors.darkerGrey
              : CosColors.light,
        ),
        const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: CosWorkTitleText(
                  title: 'Синглэ хаусны засал',
                  maxLines: 1,
                ),
              ),
              const CosLocationTitleWidthLocationIcon(title: "Яармаг"),

              /// Attrutes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'м2 ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Гэрээт ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

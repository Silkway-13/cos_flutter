import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/images/cos_circular_image.dart';
import 'package:cos_work_store/common/widgets/texts/cos_location_title_with_loc_icon.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/enums.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

class CosLocationCard extends StatelessWidget {
  const CosLocationCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = CosHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: CosRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(CosSizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: CosCircularImage(
                isNetworkImage: false,
                image: CosImages.facebook,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? CosColors.white : CosColors.black,
              ),
            ),
            const SizedBox(
              width: CosSizes.spaceBtwItems / 2,
            ),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CosLocationTitleWidthLocationIcon(
                    title: "Өмнөговь",
                    locationTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 works',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

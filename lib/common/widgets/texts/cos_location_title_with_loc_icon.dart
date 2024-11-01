import 'package:cos_work_store/common/widgets/texts/cos_location_title.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/enums.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosLocationTitleWidthLocationIcon extends StatelessWidget {
  const CosLocationTitleWidthLocationIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CosColors.primary,
    this.textAlign = TextAlign.center,
    this.locationTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes locationTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CosLocationTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            locationTextSize: locationTextSize,
          ),
        ),
        const SizedBox(
          width: CosSizes.xs,
        ),
        Icon(
          Iconsax.location5,
          color: iconColor,
          size: CosSizes.iconXs,
        )
      ],
    );
  }
}

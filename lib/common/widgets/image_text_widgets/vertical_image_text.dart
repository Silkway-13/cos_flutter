import 'package:cos_work_store/common/widgets/images/cos_circular_image.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosVerticalImageText extends StatelessWidget {
  const CosVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = CosColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CosSizes.spaceBtwItems),
        child: Column(
          /// Circular Icon
          children: [
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(CosSizes.sm),
            //   decoration: BoxDecoration(
            //     color: backgroundColor ??
            //         (dark ? CosColors.black : CosColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? CosColors.light : CosColors.dark,
            //     ),
            //   ),
            // ),
            CosCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: CosSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? CosColors.light : CosColors.dark,
            ),

            /// Text
            const SizedBox(height: CosSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

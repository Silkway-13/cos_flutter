import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/device/device_utility.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosSearchContainer extends StatelessWidget {
  const CosSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: CosSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: CosDeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(CosSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? CosColors.dark
                    : CosColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CosSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: CosColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: CosColors.darkerGrey,
              ),
              const SizedBox(
                width: CosSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}

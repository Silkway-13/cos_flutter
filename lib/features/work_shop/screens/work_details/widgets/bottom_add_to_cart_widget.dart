import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosBottomAddToCart extends StatelessWidget {
  const CosBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CosSizes.defaultSpace,
          vertical: CosSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CosColors.darkerGrey : CosColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CosSizes.cardRadiusLg),
          topRight: Radius.circular(CosSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CosCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: CosColors.darkGrey,
                width: 40,
                height: 40,
                color: CosColors.white,
              ),
              const SizedBox(
                width: CosSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: CosSizes.spaceBtwItems,
              ),
              const CosCircularIcon(
                icon: Iconsax.add,
                backgroundColor: CosColors.black,
                width: 40,
                height: 40,
                color: CosColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(CosSizes.md),
              backgroundColor: CosColors.black,
              side: const BorderSide(color: CosColors.black),
            ),
            child: const Text('Add to agreement'),
          ),
        ],
      ),
    );
  }
}

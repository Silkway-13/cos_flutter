import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosWorkQuantityWithAddRemoveButton extends StatelessWidget {
  const CosWorkQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CosCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CosSizes.md,
          color: CosHelperFunctions.isDarkMode(context)
              ? CosColors.white
              : CosColors.black,
          backgroundColor: CosHelperFunctions.isDarkMode(context)
              ? CosColors.darkerGrey
              : CosColors.black,
        ),
        const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),
        Text(
          '1000',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),
        const CosCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CosSizes.md,
          color: CosColors.white,
          backgroundColor: CosColors.primary,
        ),
      ],
    );
  }
}

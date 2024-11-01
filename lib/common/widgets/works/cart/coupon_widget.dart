import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosCouponCode extends StatelessWidget {
  const CosCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    return CosRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CosColors.dark : CosColors.white,
      padding: const EdgeInsets.only(
          top: CosSizes.sm,
          bottom: CosSizes.sm,
          right: CosSizes.sm,
          left: CosSizes.md),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? CosColors.white.withOpacity(0.5)
                      : CosColors.dark.withOpacity(0.5),
                  backgroundColor: CosColors.grey.withOpacity(0.2),
                  side: BorderSide(
                    color: CosColors.grey.withOpacity(0.1),
                  )),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}

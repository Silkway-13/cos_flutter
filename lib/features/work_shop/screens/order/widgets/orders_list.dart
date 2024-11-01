import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosOrderListItems extends StatelessWidget {
  const CosOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: CosSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => CosRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(CosSizes.md),
        backgroundColor: dark ? CosColors.dark : CosColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// 1 - Icon
                const Icon(Iconsax.sun),
                const SizedBox(
                  width: CosSizes.spaceBtwItems / 2,
                ),

                /// 1 - Status
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Хийгдэж байгаа",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: CosColors.primary, fontWeightDelta: 1),
                      ),
                      Text("01 Jun 2024",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: CosSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: CosSizes.spaceBtwItems / 2,
                      ),

                      /// 1 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Захиалга",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("[#256f2]",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: CosSizes.spaceBtwItems / 2,
                      ),

                      /// 1 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Захиалсан хугацаа",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("01 June 2024",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
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

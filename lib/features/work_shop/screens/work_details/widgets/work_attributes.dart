import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/common/widgets/texts/work_title_text.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosWorkAttributes extends StatelessWidget {
  const CosWorkAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        CosRoundedContainer(
          padding: const EdgeInsets.all(CosSizes.md),
          backgroundColor: dark ? CosColors.darkerGrey : CosColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const CosSectionHeading(
                    title: 'Гүйцэтгэл : ',
                    maxLines: 2,
                    showActionButton: false,
                  ),
                  const SizedBox(width: CosSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CosWorkTitleText(
                            title: 'Үнэлгээ : ',
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text('₮18000',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(width: CosSizes.spaceBtwItems),

                          /// Actual Price
                          // const CosWorkPriceText(price: "18000"),
                        ],
                      ),
                      Row(
                        children: [
                          const CosWorkTitleText(
                            title: 'Бартер : ',
                            smallSize: true,
                          ),

                          ///
                          Text('BWM X6',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     /// Actual Price
                  //     Text('₮18000',
                  //         style: Theme.of(context).textTheme.titleLarge),
                  //     const SizedBox(width: CosSizes.spaceBtwItems),

                  //     /// Actual Price
                  //     const CosWorkPriceText(price: "18000"),
                  //   ],
                  // ),
                ],
              ),

              /// Variation Description
              const CosWorkTitleText(
                title:
                    'This is the description of the Work and it can go upto max lines 4.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems,
        ),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CosSectionHeading(
              title: 'Хэмжээ ->',
              showActionButton: false,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('м2'),
                  selected: true,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: const Text('Айл'),
                  selected: false,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: const Text('Давхар'),
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CosSectionHeading(
              title: 'Ажиллах хэлбэр ->',
              showActionButton: false,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Өдрөөр'),
                  selected: false,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: const Text('Гэрээт'),
                  selected: true,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: const Text('Үндсэн'),
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

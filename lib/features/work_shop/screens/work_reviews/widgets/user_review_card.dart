import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/works/ratings/rating_indicator.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(CosImages.userReveiw),
                ),
                const SizedBox(
                  width: CosSizes.spaceBtwItems,
                ),
                Text(
                  'Бат',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            const CosRatingBarIndicator(rating: 4),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),
            Text(
              '14 May 2024',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'бас яах вэ? дажгүй апп болсон байна. Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: " хаах",
          trimCollapsedText: " цааш",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CosColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CosColors.primary),
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems,
        ),

        /// Company Review
        CosRoundedContainer(
          backgroundColor: dark ? CosColors.darkerGrey : CosColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(CosSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ger Company",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "01 June 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'бас яах вэ? дажгүй апп болсон байна. Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт Амжилт',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " хаах",
                  trimCollapsedText: " цааш",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CosColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CosColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: CosSizes.spaceBtwSections,
        )
      ],
    );
  }
}

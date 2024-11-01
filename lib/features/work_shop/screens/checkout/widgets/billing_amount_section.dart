import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosBillingAmountSection extends StatelessWidget {
  const CosBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Гүйцэтгэл',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '₮2000000',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),

        /// Өмнөх тооцоо
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Зээл болох үлдэгдэл',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '₮0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),

        /// Урамшуулал
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Урамшуулал',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '₮999',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),

        /// Нийт тооцоо
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Нийт тооцоо',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '₮10,000,000',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}

import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosBillingAddressSection extends StatelessWidget {
  const CosBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CosSectionHeading(
          title: 'Хийсэн ажлын мэдээлэл',
          showActionButton: true,
          buttonTitle: "өөрчлөх",
          onPressed: () {},
        ),
        Text(
          'Яармаг 1000м2 шавар',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),
            Text(
              '99114561',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: CosSizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                'Яармаг 16 давхарын',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosBillingPaymentSection extends StatelessWidget {
  const CosBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        CosSectionHeading(
          title: 'Төлбөрийн хэлбэр',
          showActionButton: true,
          buttonTitle: "өөрчлөх",
          onPressed: () {},
        ),
        const SizedBox(
          height: CosSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            CosRoundedContainer(
              width: 60,
              heigth: 35,
              backgroundColor: dark ? CosColors.light : CosColors.white,
              padding: const EdgeInsets.all(CosSizes.sm),
              child: const Image(
                image: AssetImage(CosImages.creditCard),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: CosSizes.spaceBtwItems / 2,
            ),
            Text(
              'Бэлэн мөнгө',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        )
      ],
    );
  }
}

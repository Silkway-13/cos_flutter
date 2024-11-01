import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosLoginHeader extends StatelessWidget {
  const CosLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image:
              AssetImage(dark ? CosImages.darkAppLogo : CosImages.lightAppLogo),
          height: 120,
          width: 120,
        ),
        Text(CosTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: CosSizes.sm,
        ),
        Text(
          CosTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

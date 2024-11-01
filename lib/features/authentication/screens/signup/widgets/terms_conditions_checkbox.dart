import 'package:cos_work_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosTermsAndConditionCheckbox extends StatelessWidget {
  const CosTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = CosHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: CosTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: ' ${CosTexts.privavyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? CosColors.white : CosColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? CosColors.white : CosColors.primary),
          ),
          TextSpan(
              text: CosTexts.and, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: CosTexts.termsOfUse,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? CosColors.white : CosColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? CosColors.white : CosColors.primary),
          ),
        ]))
      ],
    );
  }
}

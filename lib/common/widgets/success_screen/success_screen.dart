import 'package:cos_work_store/common/styles/spacing_styles.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CosSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image CosImages.successIllustration
              Image(
                image: AssetImage(image),
                width: CosHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// Title & SubTitle   CosTexts.yourAccountCreatedTitle, CosTexts.yourAccountCreatedSubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwItems,
              ),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // () => Get.to(() => const LoginScreen())
                  onPressed: onPressed,
                  child: const Text(CosTexts.cosContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

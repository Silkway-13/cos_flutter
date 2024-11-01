import 'package:cos_work_store/features/authentication/screens/login/login.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CosSizes.defaultSpace),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image with 60% of screen width
            Image(
              image: const AssetImage(CosImages.successIllustration),
              width: CosHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwSections,
            ),

            /// Title & SubTitle
            Text(
              CosTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            Text(
              CosTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: const Text(CosTexts.done),
              ),
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                // () => Get.to(() => const LoginScreen())
                onPressed: () {},
                child: const Text(CosTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

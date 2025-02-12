import 'package:cos_work_store/common/widgets/login_signup/form_divider.dart';
import 'package:cos_work_store/common/widgets/login_signup/social_buttons.dart';
import 'package:cos_work_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                CosTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// Form
              const CosSignupForm(),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// Divider
              CosFormDivider(dividerText: CosTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: CosSizes.spaceBtwItems,
              ),

              /// Social Buttons
              const CosSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

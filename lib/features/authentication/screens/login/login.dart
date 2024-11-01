import 'package:cos_work_store/common/styles/spacing_styles.dart';
import 'package:cos_work_store/common/widgets/login_signup/form_divider.dart';
import 'package:cos_work_store/common/widgets/login_signup/social_buttons.dart';
import 'package:cos_work_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:cos_work_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CosSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // / Logo, Title & Sub-Title
              const CosLoginHeader(),

              // / Form
              const CosLoginForm(),

              // Divider
              CosFormDivider(dividerText: CosTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              // / Footer
              const CosSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

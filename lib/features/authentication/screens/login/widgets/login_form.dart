import 'package:cos_work_store/features/authentication/controllers/login/login_controller.dart';
import 'package:cos_work_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:cos_work_store/features/authentication/screens/signup/signup.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CosLoginForm extends StatelessWidget {
  const CosLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CosSizes.spaceBtwSections),
        child: Column(
          children: [
            // / Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CosValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CosTexts.email,
              ),
            ),
            const SizedBox(
              height: CosSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) => CosValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: CosTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: CosSizes.spaceBtwInputFields / 2,
            ),

            // / Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // / Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(CosTexts.rememberMe),
                  ],
                ),
                // / Forgot Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(CosTexts.forgetPassword))
              ],
            ),
            const SizedBox(
              height: CosSizes.spaceBtwSections,
            ),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(CosTexts.signIn))),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(CosTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}

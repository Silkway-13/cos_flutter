import 'package:cos_work_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:cos_work_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CosSignupForm extends StatelessWidget {
  const CosSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormkey,
      child: Column(
        /// First Last name
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      CosValidator.validateEmptyText('Нэрээ', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CosTexts.firsName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: CosSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      CosValidator.validateEmptyText('Овог', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CosTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: CosSizes.spaceBtwInputFields,
          ),

          /// UserName
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                CosValidator.validateEmptyText('Хэрэглэгчийн', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: CosTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: CosSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => CosValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: CosTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: CosSizes.spaceBtwInputFields,
          ),

          /// Phone Number
          TextFormField(
            validator: (value) => CosValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(
                labelText: CosTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
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
            height: CosSizes.spaceBtwInputFields,
          ),

          /// Terms&Conditions Checkbox
          const CosTermsAndConditionCheckbox(),
          const SizedBox(
            height: CosSizes.spaceBtwSections,
          ),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(CosTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

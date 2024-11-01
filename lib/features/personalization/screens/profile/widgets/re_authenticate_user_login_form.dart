import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CosAppBar(
        title: Text('Хэрэглэгч баталгаажуулах'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: CosValidator.validateEmail,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CosTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwInputFields,
                ),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        CosValidator.validateEmptyText('Нууц үг', value),
                    decoration: InputDecoration(
                      labelText: CosTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(
                          controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: CosSizes.spaceBtwSections,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthanticateEmailAndPasswordUser(),
                    child: const Text('Баталгаажуулах'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

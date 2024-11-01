import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/features/personalization/controllers/update_name_controller.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CosAppBar(
        showBackArrow: true,
        title: Text(
          "Нэрээ солих",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CosSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Нэрээ солих',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        CosValidator.validateEmptyText('Нэр', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CosTexts.firsName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        CosValidator.validateEmptyText('Овог', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CosTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: CosSizes.spaceBtwSections,
            ),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Хадгалах'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

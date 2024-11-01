import 'package:cos_work_store/features/authentication/controllers/login/login_controller.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosSocialButtons extends StatelessWidget {
  const CosSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: CosColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          // Google Icon

          child: InkWell(
            onTap: () => controller.googleSignIn(),
            child: const CircleAvatar(
              radius: 18, // Adjust the radius as needed
              backgroundImage: AssetImage(CosImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: CosSizes.spaceBtwItems,
        ),
        Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            border: Border.all(color: CosColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          // Facebook Icon
          child: InkWell(
            onTap: () => {},
            child: const CircleAvatar(
              radius: 18, // Adjust the radius as needed
              backgroundImage: AssetImage(CosImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}

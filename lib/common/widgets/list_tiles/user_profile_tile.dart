import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosUserProfileTile extends StatelessWidget {
  const CosUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(CosImages.user),
      ),
      title: Text(
        (controller.user.value.fullName == "" &&
                controller.user.value.fullName.isNotEmpty)
            ? controller.user.value.fullName
            : CosTexts.homeAppbarSubTitle,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: CosColors.white),
      ),
      subtitle: Text(
        (controller.user.value.email == "" &&
                controller.user.value.email.isNotEmpty)
            ? controller.user.value.email
            : "example@gmail.com",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: CosColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: CosColors.white,
        ),
      ),
    );
  }
}

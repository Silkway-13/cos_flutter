import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:cos_work_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:cos_work_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const CosAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CosSizes.defaultSpace),
        child: Column(
          children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : CosImages.user;

                    return controller.imageUploading.value
                        ? const CosShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                        : CircleAvatar(
                            radius:
                                40, // Adjust the radius as per your requirement
                            backgroundImage: AssetImage(image),
                          );
                  }),
                  TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: const Text('Зураг солих'),
                  ),
                ],
              ),
            ),

            /// Details
            const SizedBox(
              height: CosSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),
            const CosSectionHeading(
              title: "Хэрэглэгчийн мэдээлэл",
              showActionButton: false,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            CosProfileMenu(
              title: 'Овог Нэр',
              value: controller.user.value.fullName,
              onPressed: () {},
            ),
            CosProfileMenu(
              title: 'Хэрэглэгчийн нэр',
              value: controller.user.value.username,
              onPressed: () {},
            ),

            const SizedBox(
              height: CosSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            /// Heading Personal Info
            const CosSectionHeading(
              title: 'Хувийн мэдээлэл',
              showActionButton: false,
            ),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            CosProfileMenu(
              title: 'Хэрэглэгчийн нэр',
              value: controller.user.value.fullName,
              onPressed: () => Get.to(() => const ChangeName()),
            ),
            CosProfileMenu(
              title: 'id',
              value: controller.user.value.id,
              icon: Iconsax.copy,
              onPressed: () {},
            ),
            CosProfileMenu(
              title: 'Имэйл',
              value: controller.user.value.email,
              onPressed: () {},
            ),
            CosProfileMenu(
              title: 'Утас',
              value: controller.user.value.phoneNumber,
              onPressed: () {},
            ),
            CosProfileMenu(
              title: 'Хүйс',
              value: 'эр',
              onPressed: () {},
            ),

            CosProfileMenu(
              title: 'Төрсөн он, сар, өдөр',
              value: '10 Oct, 1990',
              onPressed: () {},
            ),
            const Divider(),
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text(
                  'Akkаунт устгах',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

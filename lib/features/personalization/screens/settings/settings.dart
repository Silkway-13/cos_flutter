import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:cos_work_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:cos_work_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/features/personalization/screens/address/address.dart';
import 'package:cos_work_store/features/personalization/screens/profile/profile.dart';
import 'package:cos_work_store/features/work_shop/screens/order/order.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            CosPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  CosAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: CosColors.white),
                    ),
                  ),
                  // const SizedBox(
                  //   height: CosSizes.spaceBtwItems,
                  // ),

                  /// User Profile Card
                  CosUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(CosSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const CosSectionHeading(
                    title: 'Хэрэглэгчийн тохиргоо',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "Хаяг",
                    subTitle: "Ажилж байгаа газрын мэдээлэл ",
                    onTap: () => Get.to(() => const UserDetailAddessScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "Захиалга",
                    subTitle: "Зөвхөн админ харна. ",
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.archive,
                    title: "Түүх",
                    subTitle: "Хэрэглэгчийн хийсэн ажлын түүх ",
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.money,
                    title: "Дундын данс",
                    subTitle: "Хэрэглэгчийн хэвтэвч тооцооны мэдээлэл ",
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Мэдэгдэл",
                    subTitle: "Системд ажил нэмэгдлээ.",
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "Эдлэх урамшуулах, эрх",
                    subTitle:
                        "Хэрэглэгчийн зээлж болох мөнгөн итгэлцэлийн хэмжээ",
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Дансны мэдээлэл",
                    subTitle: "Хэрэглэгчийн гүйцэтгэл хүлээж авах хэлбэр",
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),
                  const CosSectionHeading(
                    title: 'Тохиргоо',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Гэрээ оруулах",
                    subTitle: "Гэрээг онлайнд оруулж хадгалах",
                    onTap: () {},
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe mode",
                    subTitle: "Search result is safe for all ages",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  /// -- Logout Button
                  const SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text("Гарах"),
                    ),
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

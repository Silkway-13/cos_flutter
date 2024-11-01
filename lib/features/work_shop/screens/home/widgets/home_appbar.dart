import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/works/cart/cart_menu_icon.dart';
import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosHomeAppBar extends StatelessWidget {
  const CosHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CosAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CosTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: CosColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const CosShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  (controller.user.value.fullName == "" &&
                          controller.user.value.fullName.isNotEmpty)
                      ? controller.user.value.fullName
                      : CosTexts.homeAppbarSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: CosColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CosCartCounterIcon(
          onPressed: () {},
          iconColor: CosColors.white,
        ),
      ],
    );
  }
}

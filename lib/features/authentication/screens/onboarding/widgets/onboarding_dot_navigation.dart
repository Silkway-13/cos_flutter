import 'package:cos_work_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/device/device_utility.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = CosHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: CosDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: CosSizes.defaultSpace,
      right: 0.0,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? CosColors.light : CosColors.dark,
            dotHeight: 6),
      ),
    );
  }
}

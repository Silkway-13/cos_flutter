import 'package:cos_work_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:cos_work_store/features/authentication/screens/onboarding/widgets/onboarding.dart';
import 'package:cos_work_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:cos_work_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:cos_work_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: CosImages.onBoardingImage1,
                title: CosTexts.onBoardingTitle1,
                subTitle: CosTexts.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: CosImages.onBoardingImage2,
                title: CosTexts.onBoardingTitle2,
                subTitle: CosTexts.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: CosImages.onBoardingImage3,
                title: CosTexts.onBoardingTitle3,
                subTitle: CosTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const onBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

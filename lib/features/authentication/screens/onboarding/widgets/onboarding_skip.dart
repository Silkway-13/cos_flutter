import 'package:cos_work_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: CosDeviceUtils.getAppBarHeight(),
        right: CosSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text("Алгасах"),
        ));
  }
}

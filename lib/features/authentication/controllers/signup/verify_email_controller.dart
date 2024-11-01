import 'dart:async';

import 'package:cos_work_store/common/widgets/success_screen/success_screen.dart';
import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/text_strings.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CosLoaders.successSnackBar(
          title: 'Имэйл илгээсэн',
          message: 'Та имэйлээ шалгаад баталгаажуулна уу?.');
    } catch (e) {
      CosLoaders.errorSnackbar(title: 'Имэйл: ', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: CosImages.successIllustration,
            title: CosTexts.yourAccountCreatedTitle,
            subTitle: CosTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: CosImages.successIllustration,
            title: CosTexts.yourAccountCreatedTitle,
            subTitle: CosTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}

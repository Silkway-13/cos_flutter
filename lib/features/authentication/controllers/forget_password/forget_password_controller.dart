import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/features/authentication/screens/reset_password/reset_password.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/helpers/network_manager.dart';
import 'package:cos_work_store/utils/popups/full_screen_loader.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      CosFullScreenLoader.openLoadingDialog(
          'Таны хүсэлтийг боловсруулж байна...', CosImages.successIllustration);
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        return;
      }
      // form validation
      if (forgetPasswordFormKey.currentState!.validate()) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      CosFullScreenLoader.stopLoading();

      // show success
      CosLoaders.successSnackBar(
          title: 'Имэйл илгээсэн',
          message:
              'Таны нууц үгийг шинэчлэхийн тулд имэйлийн холбоосыг илгээсэн'
                  .tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(title: 'Алдаа гарлаа ', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      CosFullScreenLoader.openLoadingDialog(
          'Таны хүсэлтийг боловсруулж байна...', CosImages.successIllustration);
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      CosFullScreenLoader.stopLoading();

      // show success
      CosLoaders.successSnackBar(
          title: 'Имэйл дахин илгээсэн',
          message:
              'Таны нууц үгийг шинэчлэхийн тулд имэйлийн холбоосыг илгээсэн'
                  .tr);
    } catch (e) {
      // Remove Loader
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(title: 'Алдаа гарлаа ', message: e.toString());
    }
  }
}

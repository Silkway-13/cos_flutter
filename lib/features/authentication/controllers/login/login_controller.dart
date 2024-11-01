import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/helpers/network_manager.dart';
import 'package:cos_work_store/utils/popups/full_screen_loader.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    // email.text = '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    // password.text = '';
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      CosFullScreenLoader.openLoadingDialog(
          'Нэвтэрч байна...', CosImages.successIllustration);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login auth
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Remove Loader
      CosFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(
        title: 'Нэвтрэхэд алдаа гарлаа: ',
        message: e.toString(),
      );
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      CosFullScreenLoader.openLoadingDialog(
          'Нэвтэрч байна...', CosImages.successIllustration);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      CosFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(
        title: 'Нэвтрэхэд алдаа гарлаа: ',
        message: e.toString(),
      );
    }
  }
}

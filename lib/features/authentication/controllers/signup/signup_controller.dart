import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/data/repositories/user/user_repository.dart';
import 'package:cos_work_store/features/authentication/models/user_model.dart';
import 'package:cos_work_store/features/authentication/screens/signup/verify_email.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/popups/full_screen_loader.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cos_work_store/utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      CosFullScreenLoader.openLoadingDialog(
          'Мэдээллийг шалгаж байна', CosImages.creditCard);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosLoaders.errorSnackbar(
          title: 'Алдаа! ',
          message: 'Интернет холболтоо шалгана уу.',
        );
        return;
      }

      // Form Validation
      if (!signupFormkey.currentState!.validate()) return;

      // Privacy
      if (!privacyPolicy.value) {
        CosLoaders.warningSnackbar(
          title: "Нууцлалыг зөвшөөрч байна уу?",
          message:
              "Бүртгэл үүсгэхийн тулд та Нууцлалын бодлого болон ашиглалтын нөхцлийг уншиж, хүлээн зөвшөөрөх ёстой",
        );
        return;
      }
      // Register
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Remove Loader
      CosFullScreenLoader.stopLoading();

      // Show Success
      CosLoaders.successSnackBar(
          title: 'Амжилттай!',
          message: 'Таны бүртгэл үүслээ. Та имэйлээр баталгаажуулна уу?');
      // Move to Verify Email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(
        title: 'Алдаа! ',
        message: e.toString(),
      );
    }
  }
}

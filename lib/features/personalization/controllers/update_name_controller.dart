import 'package:cos_work_store/data/repositories/user/user_repository.dart';
import 'package:cos_work_store/features/personalization/controllers/user_controller.dart';
import 'package:cos_work_store/features/personalization/screens/profile/profile.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/helpers/network_manager.dart';
import 'package:cos_work_store/utils/popups/full_screen_loader.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      CosFullScreenLoader.openLoadingDialog(
          'Таны мэдээллийг шинэчилж байна...', CosImages.successIllustration);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        CosLoaders.errorSnackbar(
            title: 'Алдаа!', message: 'Интернэт холболтоо шалгана уу.');
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      // Prepare Data
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      // Update User Info
      await userRepository.updateSingleField(name);

      // Update Local User Info
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      CosFullScreenLoader.stopLoading();

      // Show Success Message and Redirect
      CosLoaders.successSnackBar(
          title: 'Амжилттай!', message: 'Таны мэдээлэл шинэчлэгдлээ.');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.errorSnackbar(
          title: 'Алдаа!',
          message: 'Мэдээлэл шинэчлэхэд алдаа гарлаа: ${e.toString()}');
    }
  }
}

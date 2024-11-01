import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/data/repositories/user/user_repository.dart';
import 'package:cos_work_store/features/authentication/models/user_model.dart';
import 'package:cos_work_store/features/authentication/screens/login/login.dart';
import 'package:cos_work_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/network_manager.dart';
import 'package:cos_work_store/utils/popups/full_screen_loader.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? "");

          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      CosLoaders.warningSnackbar(
          title: 'Мэдээлэл хадгалагдсангүй.',
          message: 'Ямар нэг асуудал байна.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(CosSizes.md),
        title: "Аккаунт устгах",
        middleText: 'Итгэлтэй байна уу?',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: CosColors.error,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: CosSizes.lg),
            child: Text('Устгах'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Get.back(), child: const Text('Буцах')));
  }

  Future<void> deleteUserAccount() async {
    try {
      CosFullScreenLoader.openLoadingDialog(
          'Устгаж байна...', CosImages.creditCard);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CosFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          CosFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.warningSnackbar(
          title: 'Алдаа!',
          message: 'Аккаунт устгахад алдаа гарлаа: ${e.toString()}');
    }
  }

  Future<void> reAuthanticateEmailAndPasswordUser() async {
    try {
      CosFullScreenLoader.openLoadingDialog(
          'Түр хүлээнэ үү...', CosImages.creditCard);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CosFullScreenLoader.stopLoading();
        CosLoaders.errorSnackbar(
            title: 'Алдаа!', message: 'Интернэт холболтоо шалгана уу.');
        return;
      }

      // Validate Form
      if (!reAuthFormKey.currentState!.validate()) {
        CosFullScreenLoader.stopLoading();
        return;
      }

      // Re-authenticate
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      // Delete Account
      await AuthenticationRepository.instance.deleteAccount();

      CosFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CosFullScreenLoader.stopLoading();
      CosLoaders.warningSnackbar(
          title: 'Алдаа!',
          message: 'Аккаунт устгахад алдаа гарлаа: ${e.toString()}');
    }
  }

  void uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;
        // upload
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        // update
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        CosLoaders.successSnackBar(
            title: 'Aмжилттай', message: 'Зураг солигдлоо.');
      }
    } catch (e) {
      CosLoaders.errorSnackbar(
          title: 'Алдаа!',
          message: 'Зураг оруулахад алдаа гарлаа: ${e.toString()}');
    } finally {
      imageUploading.value = false;
    }
  }
}

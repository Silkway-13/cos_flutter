import 'package:cos_work_store/data/repositories/user/user_repository.dart';
import 'package:cos_work_store/features/authentication/screens/login/login.dart';
import 'package:cos_work_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:cos_work_store/features/authentication/screens/signup/verify_email.dart';
import 'package:cos_work_store/navigation_menu.dart';
import 'package:cos_work_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:cos_work_store/utils/exceptions/firebase_exceptoins.dart';
import 'package:cos_work_store/utils/exceptions/format_exceptions.dart';
import 'package:cos_work_store/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relavant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      if (kDebugMode) {
        print(deviceStorage.read('isFirstTime'));
      }

      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

/* -------- Email & Password sign-in ---------- */

  /// SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// Mail verify
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// ReAuth user reAuthenticateWithEmailAndPassword
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// ForgetPass

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

/* -------- Social sign in ---------- */
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the obtained credentials
      return await _auth.signInWithCredential(credentials);
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Алдаа гарлаа: $e");
      return null;
    }
  }

  /// Facebook

/* -------- Verify federed ---------- */

  /// LogoutUser
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// DeleteUser
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on CosFirebaseAuthException catch (e) {
      throw CosFirebaseAuthException(e.code).message;
    } on CosFirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on CosFormatException catch (_) {
      throw const CosFormatException();
    } on CosPlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }
}

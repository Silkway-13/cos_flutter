import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cos_work_store/data/repositories/authentication/authentication_repository.dart';
import 'package:cos_work_store/features/authentication/models/user_model.dart';
import 'package:cos_work_store/utils/exceptions/firebase_exceptoins.dart';
import 'package:cos_work_store/utils/exceptions/format_exceptions.dart';
import 'package:cos_work_store/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Register
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// Register
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// UpdateUser
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// updateSingleField
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// updateSingleField
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// upload image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CosFormatException();
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }
}

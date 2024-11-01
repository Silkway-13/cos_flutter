import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cos_work_store/data/services/firebase_storage_service.dart';
import 'package:cos_work_store/features/work_shop/models/category_model.dart';
import 'package:cos_work_store/utils/exceptions/firebase_exceptoins.dart';
import 'package:cos_work_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables

  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      if (snapshot.docs.isEmpty) {
        return []; // Return an empty list if there are no documents
      }
      return list;
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.message}');
      throw CosFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print('PlatformException: ${e.message}');
      throw CosPlatformException(e.code).message;
    } catch (e) {
      print('General Exception: $e');
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }

  /// Sub cate
  /// Upload
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(CosFirebaseStorageService());
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData("Categories", file, category.name);

        category.image = url;

        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw CosFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CosPlatformException(e.code).message;
    } catch (e) {
      throw 'Алдаа гарлаа. Дахин оролдоно уу?';
    }
  }
}

import 'package:cos_work_store/data/repositories/categories/category_repository.dart';
import 'package:cos_work_store/features/work_shop/models/category_model.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load categories
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      print('Fetching categories...');

      final categories = await _categoryRepository.getAllCategories();
      print('Categories fetched successfully.');

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
      print('Featured categories filtered and assigned.');
    } catch (e, stacktrace) {
      print('Error occurred: $e');
      print('Stacktrace: $stacktrace');
      CosLoaders.errorSnackbar(
          title: 'Ажлын төрөл алдаа!', message: e.toString());
    } finally {
      isLoading.value = false;
      print('Loading state set to false.');
    }
  }
}

import 'package:cos_work_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:cos_work_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:cos_work_store/features/work_shop/controllers/category_controller.dart';
import 'package:cos_work_store/features/work_shop/screens/sub_category/sub_categories.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosHomeCategories extends StatelessWidget {
  const CosHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) {
          return const CosCategoryShimmer();
        }

        if (categoryController.featuredCategories.isEmpty) {
          // return Center(
          //   child: Text(
          //     'Өгөгдөл олдсонгүй!',
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyMedium!
          //         .apply(color: Colors.white),
          //   ),
          // );
          // testing data
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CosVerticalImageText(
                  image: CosImages.facebook,
                  title: "Шавар",
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return CosVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      },
    );
  }
}

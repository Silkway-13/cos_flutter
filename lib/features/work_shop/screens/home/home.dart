import 'package:cos_work_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_card_vertical.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/features/work_shop/screens/all_works.dart/all_works.dart';
import 'package:cos_work_store/features/work_shop/screens/home/widgets/home_appbar.dart';
import 'package:cos_work_store/features/work_shop/screens/home/widgets/home_categories.dart';
import 'package:cos_work_store/features/work_shop/screens/home/widgets/promo_slider.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const CosPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar --
                  CosHomeAppBar(),
                  SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),

                  /// -- Searchbar --
                  CosSearchContainer(
                    text: "Ажил хайх",
                  ),
                  SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),

                  /// -- Categories --
                  Padding(
                    padding: EdgeInsets.only(left: CosSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading --
                        CosSectionHeading(
                          title: 'Ажлын төрлүүд',
                          showActionButton: false,
                          textColor: CosColors.white,
                        ),
                        SizedBox(
                          height: CosSizes.spaceBtwItems / 2,
                        ),

                        /// -- Categories --
                        CosHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(CosSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider --
                  const CosPromoSlider(
                    banners: [
                      CosImages.promoBanner1,
                      CosImages.promoBanner2,
                    ],
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems / 2,
                  ),

                  /// -- Heading
                  CosSectionHeading(
                    title: "Захиалагдсан ажлууд",
                    onPressed: () => Get.to(() => const AllWorks()),
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems / 2,
                  ),

                  /// -- Ordered Works --
                  CosGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const CosWorkCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

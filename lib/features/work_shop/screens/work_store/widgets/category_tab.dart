import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/locations/location_show_case.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_card_vertical.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosCategoryTab extends StatelessWidget {
  const CosCategoryTab({super.key});
  // const CosCategoryTab({super.key, required this.category});

  // final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Locations
              const CosLocationShowcase(
                images: [
                  CosImages.workImage1,
                  CosImages.workImage1,
                  CosImages.workImage1,
                ],
              ),
              const CosLocationShowcase(
                images: [
                  CosImages.workImage1,
                  CosImages.workImage1,
                  CosImages.workImage1,
                ],
              ),
              const SizedBox(
                height: CosSizes.spaceBtwItems / 2,
              ),

              /// -- Works
              CosSectionHeading(title: "Санал болгож буй", onPressed: () {}),
              const SizedBox(
                height: CosSizes.spaceBtwItems / 2,
              ),

              CosGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const CosWorkCardVertical()),
              const SizedBox(
                height: CosSizes.spaceBtwItems / 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

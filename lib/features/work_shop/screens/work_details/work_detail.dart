import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/widgets/rating_share_widget.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/widgets/work_attributes.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/widgets/work_detail_image_slider.dart';
import 'package:cos_work_store/features/work_shop/screens/work_details/widgets/work_meta_data.dart';
import 'package:cos_work_store/features/work_shop/screens/work_reviews/work_reviews.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class WorkDetail extends StatelessWidget {
  const WorkDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CosBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Work Image Slider
            const CosWorkImageSlider(),

            /// 2 - Work Details
            Padding(
              padding: const EdgeInsets.only(
                  right: CosSizes.defaultSpace,
                  left: CosSizes.defaultSpace,
                  bottom: CosSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share

                  const CosRatingAndShare(),

                  /// - Price, Percent of Performance Title, Description, Location
                  const CosWorkMetaData(),

                  /// - Attributes
                  const CosWorkAttributes(),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),

                  /// - Agreement
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Гэрээ хийх"),
                    ),
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),

                  /// - Description
                  const CosSectionHeading(
                    title: 'Тайлбар',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'This is a Work description. This is a Work description. This is a Work description. There are more things that can be added',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' цааш',
                    trimExpandedText: ' хаах',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CosSectionHeading(
                        title: 'Сэтгэгдэл & Үнэлгээ(89)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () =>
                            Get.to(() => const WorkReviewsScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/images/cos_rounded_image.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_card_horizal.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosAppBar(
        title: Text("Дотор засал"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const CosRoundedImage(
                width: double.infinity,
                imageUrl: CosImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// Sub-Categorios
              Column(
                children: [
                  /// Heading
                  CosSectionHeading(
                    title: 'Обой наах',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: CosSizes.spaceBtwItems / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: CosSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const CosWorkCardHorizontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

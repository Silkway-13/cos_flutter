import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/common/widgets/images/cos_rounded_image.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosWorkImageSlider extends StatelessWidget {
  const CosWorkImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return CosCurvedEdgeWidget(
      child: Container(
        color: dark ? CosColors.darkerGrey : CosColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(CosSizes.workImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(CosImages.workImage1),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CosSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: CosSizes.spaceBtwItems),
                  itemBuilder: (_, index) => CosRoundedImage(
                    width: 80,
                    imageUrl: CosImages.workImage1,
                    border: Border.all(color: CosColors.primary),
                    padding: const EdgeInsets.all(CosSizes.xs),
                    backgroundColor: dark ? CosColors.dark : CosColors.white,
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            const CosAppBar(
              showBackArrow: true,
              actions: [
                CosCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

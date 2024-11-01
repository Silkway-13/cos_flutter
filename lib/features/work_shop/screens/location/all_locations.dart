import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/locations/location_card.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/features/work_shop/screens/location/location_works.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllLocationsScreen extends StatelessWidget {
  const AllLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosAppBar(
        title: Text("Байршил"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const CosSectionHeading(
                title: 'Байршлууд',
                showActionButton: false,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwItems,
              ),

              /// Locations
              CosGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => CosLocationCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const LocationWorks()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/locations/location_card.dart';
import 'package:cos_work_store/common/widgets/works/sortable/sortable_works.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LocationWorks extends StatelessWidget {
  const LocationWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CosAppBar(
        title: Text('Өмнөговь'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              /// Location Detail
              CosLocationCard(showBorder: true),
              SizedBox(
                height: CosSizes.spaceBtwSections,
              ),
              CosSortableWorks(),
            ],
          ),
        ),
      ),
    );
  }
}

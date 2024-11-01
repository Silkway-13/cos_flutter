import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_card_vertical.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosSortableWorks extends StatelessWidget {
  const CosSortableWorks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Өндөр үнэтэй',
            'Бага үнэтэй',
            'Байршилаар хайх',
            'Үнэ тохиролцох',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: CosSizes.spaceBtwSections,
        ),

        /// Works

        CosGridLayout(
          itemCount: 10,
          itemBuilder: (_, index) => const CosWorkCardVertical(),
        ),
      ],
    );
  }
}

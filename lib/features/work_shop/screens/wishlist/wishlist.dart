import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/icons/cos_circular_icon.dart';
import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_card_vertical.dart';
import 'package:cos_work_store/features/work_shop/screens/home/home.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CosAppBar(
        title: Text(
          "Сонирхсон",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CosCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              CosGridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const CosWorkCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}

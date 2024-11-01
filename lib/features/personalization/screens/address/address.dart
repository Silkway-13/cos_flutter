import "package:cos_work_store/common/widgets/appbar/appbar.dart";
import "package:cos_work_store/features/personalization/screens/address/add_new_address.dart";
import "package:cos_work_store/features/personalization/screens/address/widgets/single_address.dart";
import "package:cos_work_store/utils/constants/colors.dart";
import "package:cos_work_store/utils/constants/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";

class UserDetailAddessScreen extends StatelessWidget {
  const UserDetailAddessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: CosColors.primary,
        onPressed: () => Get.to(
          () => const AddNewAddessScreen(),
        ),
        child: const Icon(
          Iconsax.add,
          color: CosColors.white,
        ),
      ),
      appBar: CosAppBar(
        showBackArrow: true,
        title: Text(
          'Мэдээлэл',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              CosSingleAddress(selectedAddress: false),
              CosSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}

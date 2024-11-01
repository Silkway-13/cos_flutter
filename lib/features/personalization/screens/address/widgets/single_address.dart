import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CosSingleAddress extends StatelessWidget {
  const CosSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return CosRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(CosSizes.md),
      width: double.infinity,
      backgroundColor: selectedAddress
          ? CosColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? CosColors.darkerGrey
              : CosColors.grey,
      margin: const EdgeInsets.only(bottom: CosSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? CosColors.light
                      : CosColors.dark.withOpacity(0.2)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Бат Болд',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: CosSizes.sm / 2,
              ),
              const Text(
                '+976 99111991',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: CosSizes.sm / 2,
              ),
              const Text(
                '123456 Болд, Бат, Хөвсгөл, Мөрөн сум',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

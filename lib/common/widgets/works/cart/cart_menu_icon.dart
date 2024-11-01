import 'package:cos_work_store/features/work_shop/screens/cart/cart.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CosCartCounterIcon extends StatelessWidget {
  const CosCartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
        onPressed: () => Get.to(() => const CartScreen()),
        icon: Icon(
          Iconsax.shopping_bag,
          color: iconColor,
        ),
      ),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: CosColors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              "2",
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: CosColors.white,
                    fontSizeFactor: 0.8,
                  ),
            ),
          ),
        ),
      )
    ]);
  }
}

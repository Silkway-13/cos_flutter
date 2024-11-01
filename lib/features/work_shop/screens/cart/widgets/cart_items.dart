import 'package:cos_work_store/common/widgets/works/cart/add_remove_button.dart';
import 'package:cos_work_store/common/widgets/works/cart/cart_item.dart';
import 'package:cos_work_store/common/widgets/works/work_cards/work_price_text.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosCartItems extends StatelessWidget {
  const CosCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(
        height: CosSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const CosCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(
              height: CosSizes.spaceBtwItems,
            ),

          /// Add Remove Button Row with total Price
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(
                      width: 70,
                    ),

                    /// Add Remove Buttons
                    CosWorkQuantityWithAddRemoveButton(),
                  ],
                ),

                /// Price
                CosWorkPriceText(price: '300,000,000'),
              ],
            )
        ],
      ),
    );
  }
}

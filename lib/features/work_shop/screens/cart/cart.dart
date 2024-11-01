import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/features/work_shop/screens/cart/widgets/cart_items.dart';
import 'package:cos_work_store/features/work_shop/screens/checkout/checkout.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CosAppBar(
        title: Text(
          "Ажлын хуудас",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(CosSizes.defaultSpace),

        /// -- Items in Cart
        child: CosCartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CosSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text("Checkout ₮4000000.00"),
        ),
      ),
    );
  }
}

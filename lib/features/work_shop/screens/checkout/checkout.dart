import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:cos_work_store/common/widgets/success_screen/success_screen.dart';
import 'package:cos_work_store/common/widgets/works/cart/coupon_widget.dart';
import 'package:cos_work_store/features/work_shop/screens/cart/widgets/cart_items.dart';
import 'package:cos_work_store/features/work_shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:cos_work_store/features/work_shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:cos_work_store/features/work_shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:cos_work_store/navigation_menu.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CosAppBar(
        showBackArrow: true,
        title: Text(
          "Гэрээний хуудас",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const CosCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// -- Coupon TextField
              const CosCouponCode(),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              CosRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CosSizes.md),
                backgroundColor: dark ? CosColors.black : CosColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    CosBillingAmountSection(),
                    SizedBox(
                      height: CosSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: CosSizes.spaceBtwItems,
                    ),

                    /// Payment methods
                    CosBillingPaymentSection(),
                    SizedBox(
                      height: CosSizes.spaceBtwItems,
                    ),

                    /// Address
                    CosBillingAddressSection(),
                    SizedBox(
                      height: CosSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CosSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: CosImages.creditCard,
              title: 'Тооцоо хийх хүсэлт',
              subTitle:
                  'Таны хүсэлт илгээгдлээ тун удахгүй таны гүйцэтгэл орох болно.',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text("Хүсэлт ₮4000000.00"),
        ),
      ),
    );
  }
}

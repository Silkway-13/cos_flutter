import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/features/work_shop/screens/order/widgets/orders_list.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: CosAppBar(
        title: Text(
          "Захиалгын хуудас",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(CosSizes.defaultSpace),

        /// -- Orders
        child: CosOrderListItems(),
      ),
    );
  }
}

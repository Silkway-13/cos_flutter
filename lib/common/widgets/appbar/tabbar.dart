import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/device/device_utility.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CosTapBar extends StatelessWidget implements PreferredSizeWidget {
  const CosTapBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = CosHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? CosColors.black : CosColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CosColors.primary,
        unselectedLabelColor: CosColors.darkGrey,
        labelColor: dark ? CosColors.white : CosColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CosDeviceUtils.getAppBarHeight());
}

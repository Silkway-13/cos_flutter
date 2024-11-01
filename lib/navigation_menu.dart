import 'package:cos_work_store/features/personalization/screens/settings/settings.dart';
import 'package:cos_work_store/features/work_shop/screens/home/home.dart';
import 'package:cos_work_store/features/work_shop/screens/wishlist/wishlist.dart';
import 'package:cos_work_store/features/work_shop/screens/work_store/work_store.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = CosHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? CosColors.black : CosColors.white,
          indicatorColor: darkMode
              ? CosColors.white.withOpacity(0.1)
              : CosColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Нүүр'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Ажил'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Сонирхсон'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Миний'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const WorkStore(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}

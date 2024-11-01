import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/appbar/tabbar.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:cos_work_store/common/widgets/layouts/grid_layout.dart';
import 'package:cos_work_store/common/widgets/locations/location_card.dart';
import 'package:cos_work_store/common/widgets/texts/section_heading.dart';
import 'package:cos_work_store/common/widgets/works/cart/cart_menu_icon.dart';
import 'package:cos_work_store/features/work_shop/screens/location/all_locations.dart';
import 'package:cos_work_store/features/work_shop/screens/work_store/widgets/category_tab.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkStore extends StatelessWidget {
  const WorkStore({super.key});

  @override
  Widget build(BuildContext context) {
    // final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: 5,
      // length: categories.length,
      child: Scaffold(
        /// -- Appbar --
        appBar: CosAppBar(
          title: Text(
            "Ажлууд",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CosCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          /// -- Header --
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: CosHelperFunctions.isDarkMode(context)
                    ? CosColors.black
                    : CosColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CosSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(
                        height: CosSizes.spaceBtwItems,
                      ),
                      const CosSearchContainer(
                        text: 'Ажил хайх',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: CosSizes.spaceBtwSections,
                      ),

                      /// -- Feature work in Location
                      CosSectionHeading(
                        title: "Байршлууд ",
                        onPressed: () =>
                            Get.to(() => const AllLocationsScreen()),
                      ),
                      const SizedBox(
                        height: CosSizes.spaceBtwItems / 2,
                      ),

                      /// -- workd GRID
                      CosGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const CosLocationCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs --
                bottom: const CosTapBar(
                  tabs: [
                    Tab(
                      child: Text("Шавар"),
                    ),
                    Tab(
                      child: Text("Өрлөг"),
                    ),
                    Tab(
                      child: Text("Цонх"),
                    ),
                    Tab(
                      child: Text("Хаалга"),
                    ),
                    Tab(
                      child: Text("Шал"),
                    ),
                  ],
                  // tabs: categories.map((category) {
                  //   return Tab(
                  //     child: Text(category.name),
                  //   );
                  // }).toList(),
                ),
              ),
            ];
          },

          /// -- Body --
          body: const TabBarView(
            children: [
              CosCategoryTab(),
              CosCategoryTab(),
              CosCategoryTab(),
              CosCategoryTab(),
              CosCategoryTab(),
            ],
            // children: categories
            //     .map((category) => CosCategoryTab(category: category))
            //     .toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:Twisted/common/widgets/appbar/appbar.dart';
import 'package:Twisted/common/widgets/appbar/tabbar.dart';
import 'package:Twisted/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:Twisted/common/widgets/layouts/grid_layout.dart';
import 'package:Twisted/common/widgets/skins_cart/cart_menu_icon.dart';
import 'package:Twisted/common/widgets/texts/section_heading.dart';
import 'package:Twisted/features/shop/screens/store/widgets/category_tab.dart';
import 'package:Twisted/utils/constants/colors.dart';
import 'package:Twisted/utils/constants/sizes.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/rarity/rarity_card.dart';
import '../../controllers/category_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Skins',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
                onPressed: () {}, iconColor: TColors.secondaryColor)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.textWhite,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search Bar
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: '',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// -- Rarity
                        TSectionHeading(
                          title: 'Gun Rarities',
                          showActionButton: true,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TRarityCard(
                              showBorder: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList())
              ),
            ];
          },
          body: TabBarView(children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}



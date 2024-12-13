import 'package:Twisted/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:Twisted/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:Twisted/features/authentication/screens/home/widgets/home_categories.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const TPrimaryHeaderContainer(
            child: Column(
              children: [
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),
                TSearchContainer(
                  text: 'Search in Store',
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Heading
                      TSectionHeading(
                        title: 'Gun Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// -- Categories
                      THomeCategories(),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections,)
              ],
            ),
          ),

          /// -- Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Promo Sliders
                const TPromoSlider(banners: [
                  TImages.arcaneBanner,
                  TImages.doomBringerBanner,
                  TImages.nocturnumBanner
                ]),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Heading
                TSectionHeading(title: 'Newest Skins', onPressed: (){}),
                const SizedBox(height: TSizes.spaceBtwItems,),

                /// -- Recent Products
                TGridLayout(itemCount: 4,itemBuilder: (_, index) => const TProductCardVertical(),),
              ],
            ),
          ),

        ],
      ),
    ));
  }
}



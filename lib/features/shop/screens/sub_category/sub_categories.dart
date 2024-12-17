import 'package:Twisted/common/widgets/appbar/appbar.dart';
import 'package:Twisted/common/widgets/images/t_rounded_image.dart';
import 'package:Twisted/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:Twisted/common/widgets/texts/section_heading.dart';
import 'package:Twisted/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Vandal'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Banner
            TRoundedImage(imageUrl: TImages.arcaneBanner,width: double.infinity,applyImageRadius: true,),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Sub Categories
            Column(
              children: [
                ///Heading
                TSectionHeading(title: 'Vandal Skins', onPressed: (){},),
                const SizedBox(height: TSizes.spaceBtwItems /2,),

                TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
              ],
            )
          ],
        ),
        ),
      ),

    );
  }
}

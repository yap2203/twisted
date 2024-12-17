import 'package:Twisted/common/widgets/layouts/grid_layout.dart';
import 'package:Twisted/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:Twisted/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/rarity/rarity_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class TCategoryTab extends StatelessWidget{
  const TCategoryTab ({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context){
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Rarity
            const TRarityShowcase(images: [TImages.kuronamiVandal,TImages.reaverVandal,TImages.rgxVandal],),
            const SizedBox(height: TSizes.spaceBtwItems,),
      
            /// Skin
            TSectionHeading(title: 'You Might Like', showActionButton: true, onPressed: (){}),
            const SizedBox(height: TSizes.spaceBtwItems,),
      
            TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
      ),
      ],
    );
  }
}
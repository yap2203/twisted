import 'package:Twisted/common/widgets/texts/product_title_text.dart';
import 'package:Twisted/common/widgets/texts/t_rarity_title_text_with_icon.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget{
  const TProductMetaData({super.key});


  @override
  Widget build(BuildContext context){
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Product Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding:const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('New!',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),


          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        /// Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TProductTitleText(title: 'Arcane Vandal'),

            const SizedBox(width: TSizes.spaceBtwItems,),

            /// RP PRICE
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Text(
                    '2,175',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: TSizes.xs), // Add some spacing
                Image.asset(
                  TImages.rpIcon,
                  width: TSizes.iconSm,
                  height: TSizes.iconSm,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),

        /// Rarity
        const TRarityTitleTextWithIcon(title: 'Exclusive', image: TImages.exclusiveIcon, rarityTextSize: TextSizes.small,),
        const SizedBox(height: TSizes.spaceBtwItems,),

      ],
    );
  }
}
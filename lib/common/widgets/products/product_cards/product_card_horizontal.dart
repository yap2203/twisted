import 'package:Twisted/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:Twisted/common/widgets/images/t_rounded_image.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_rarity_title_text_with_icon.dart';


class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
        width: 310,
        padding:  const EdgeInsets.all(1),
    decoration: BoxDecoration(
    boxShadow: [TShadowStyle.verticalProductShadow],
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.textWhite,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark? TColors.dark : TColors.light,
            child: Stack(
              children: [

                ///--Thumbnail Image
                const SizedBox(
                  height:120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.arcaneVandal, applyImageRadius: true,)
                ),

                /// Product Tag
                Positioned(
                  top: 12,
                  left:1,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                    padding:  const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('New!',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                /// Favourite Icon Button
                const Positioned(
                  top:0,
                  right: 0,
                  child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: TColors.primaryBackground),
                ),


              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                          title: 'Arcane Vandal', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TRarityTitleTextWithIcon(
                          title: 'Exclusive', image: TImages.exclusiveIcon),
                    ],
                  ),
                ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: Text(
                                '2,175',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(width: TSizes.xs),
                            // Add some spacing
                            Image.asset(
                              TImages.rpIcon,
                              width: TSizes.iconXs,
                              height: TSizes.iconXs,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),

                    ///Add cart
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(TSizes.productImageRadius),
                        ),
                      ),
                      child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(Iconsax.add, color: TColors.textWhite),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}

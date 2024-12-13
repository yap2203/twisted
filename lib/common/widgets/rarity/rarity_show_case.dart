import 'package:Twisted/common/widgets/rarity/rarity_card.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class TRarityShowcase extends StatelessWidget {
  const TRarityShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Vandal
          const TRarityCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),

          /// Top 3 Vandal Skins
          Row(
            children: images
                .map((image) => rarityTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget rarityTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(image: AssetImage(image)),
      ),
    );
  }
}
import 'package:Twisted/common/widgets/texts/section_heading.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget{
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Selected Attribute Pricing & Description
        // TRoundedContainer(
        //     backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        //   child: Padding(
        //     padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         ///Title,price
        //         const Padding(
        //           padding: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               TSectionHeading(title: 'Variation', showActionButton: false,),
        //             ],
        //           ),
        //         ),
        //
        //         /// Variation Description
        //         Padding(
        //           padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        //           child: Text(
        //             'The Arcane Collection is a collection of cosmetics in VALORANT. In Episode 3, celebrating the RiotX Arcane event and the release of Arcane, and in Episode 9, celebrating Season 2 of the Arcane series. Its contents were available for a limited time on initial release from multiple sources.',
        //             style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 0.8),
        //             textAlign: TextAlign.justify,
        //           ),
        //         ),
        //
        //       ],
        //     ),
        //   ),
        // ),
        // const SizedBox(height: TSizes.spaceBtwItems,),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Variants'),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: false,),
                TChoiceChip(text: 'Blue', selected: true,),
                TChoiceChip(text: 'Yellow', selected: false,),
              ],
            )
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
      ],
    );
  }
}


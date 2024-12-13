import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [

            /// Product Details
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5,
                  color: TColors.primaryBackground,)
              ],
            ),

            /// Main 3D Large
            const SizedBox(
                height: 330,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    // Add padding to the top
                    left: TSizes.productImageRadius,
                    // Keep padding for the left
                    right: TSizes.productImageRadius,
                    // Keep padding for the right
                    bottom: TSizes
                        .productImageRadius, // Keep padding for the bottom
                  ),
                  child: Center(
                    child: Flutter3DViewer(
                        src: TImages.arcane3dVandal),
                  ),
                )
            ),

            /// Chroma Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(
                      width: TSizes.spaceBtwItems),
                  itemCount: 4,
                  itemBuilder: (_, index) =>
                      TRoundedImage(
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors
                            .textWhite,
                        border: Border.all(color: TColors.primaryBackground),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.arcaneVandal,
                      ),
                ),
              ),
            )


            // Appbar Icon
          ],
        ),
      ),
    );
  }
}
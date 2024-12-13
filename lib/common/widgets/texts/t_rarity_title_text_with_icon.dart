import 'package:Twisted/common/widgets/texts/t_rarity_title_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class TRarityTitleTextWithIcon extends StatelessWidget {
  const TRarityTitleTextWithIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryBackground,
    this.textAlign = TextAlign.center,
    this.rarityTextSize = TextSizes.small,
    required this.image,
    this.isNetworkImage = false,
    this.fit = BoxFit.contain,

  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final bool isNetworkImage;
  final TextSizes rarityTextSize;
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TRarityTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            rarityTextSize: rarityTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        SizedBox(
          width: TSizes.iconXs,
          height: TSizes.iconXs,
          child: Image(
            fit: fit,
            image: isNetworkImage? NetworkImage(image): AssetImage(image) as ImageProvider,
          ),
        ),
      ],
    );
  }
}

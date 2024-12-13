import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';

class TRarityTitleText extends StatelessWidget {
  const TRarityTitleText({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.rarityTextSize = TextSizes.small,
    this.color,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes rarityTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: rarityTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : rarityTextSize == TextSizes.large
              ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
              : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}

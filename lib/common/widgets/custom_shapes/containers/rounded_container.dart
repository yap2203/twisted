import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget{
  const TRoundedContainer({
    super.key,
    this.child,
    this.width ,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.backgroundColor = TColors.textWhite,
    this.borderColor = TColors.primaryBackground,
});

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;


  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child:child,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:Twisted/utils/constants/image_strings.dart';

import 'package:Twisted/utils/constants/text_strings.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget{
  const TLoginHeader({
    super.key,
});

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Image(
          height: 180,
          image: AssetImage(dark ? TImages.lightValorantAppLogo : TImages.darkValorantAppLogo),
        ),
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
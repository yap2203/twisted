import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){

          final items = [
            {'image': TImages.vandalLogo, 'title': 'Vandal','onTap' : () {}},
            {'image': TImages.phantomLogo, 'title': 'Phantom','onTap' : () {}},
            {'image': TImages.guardianLogo, 'title': 'Guardian','onTap' : () {}},
            {'image': TImages.bulldogLogo, 'title': 'Bulldog','onTap' : () {}},
            {'image': TImages.spectreLogo, 'title': 'Spectre','onTap' : () {}},
            {'image': TImages.stingerLogo, 'title': 'Stinger','onTap' : () {}},
          ];

          final item = items[index];

          return TVerticalImageText(
            image: item['image'] as String,
            title: item['title'] as String,
            onTap: item['onTap'] as void Function()?,
          );

        },
      ),
    );
  }
}

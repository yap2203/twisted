import 'package:Twisted/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            {'image': TImages.vandalLogo, 'title': 'Vandal','onTap' : () => Get.to(() => const SubCategoriesScreen())},
            {'image': TImages.phantomLogo, 'title': 'Phantom','onTap' : () => Get.to(() => const SubCategoriesScreen())},
            {'image': TImages.guardianLogo, 'title': 'Guardian','onTap' : () => Get.to(() => const SubCategoriesScreen())},
            {'image': TImages.bulldogLogo, 'title': 'Bulldog','onTap' : () => Get.to(() => const SubCategoriesScreen())},
            {'image': TImages.spectreLogo, 'title': 'Spectre','onTap' : () => Get.to(() => const SubCategoriesScreen())},
            {'image': TImages.stingerLogo, 'title': 'Stinger','onTap' : () => Get.to(() => const SubCategoriesScreen())},
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

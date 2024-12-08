import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Twisted/utils/constants/sizes.dart';
import 'package:Twisted/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar ({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(onPressed:() =>   Get.back(), icon: const Icon(Iconsax.arrow_left))
              : leadingIcon != null ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)) : null,
          title: title,
          actions: actions,
          backgroundColor: Colors.transparent,
          elevation: 0,

        ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
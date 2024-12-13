import 'package:Twisted/utils/device/device_utility.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {

  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark? TColors.black : TColors.textWhite,
      child: TabBar(
        tabs:tabs,
        isScrollable: true,
        indicatorColor: TColors.primaryBackground,
        labelColor: dark? TColors.textWhite : TColors.primaryBackground,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
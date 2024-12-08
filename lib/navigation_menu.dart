import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Twisted/features/authentication/screens/home/home.dart';
import 'package:Twisted/utils/constants/colors.dart';
import 'package:Twisted/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget{
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.textWhite.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.gallery), label: "Skins"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Home"),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int>selectedIndex = 0.obs;

  final screens = [const HomeScreen(),Container(color:Colors.purple),Container(color:Colors.orange),Container(color:Colors.blue)];
}
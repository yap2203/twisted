import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THelperFunctions {
  static Color? getColor(String value){

    if(value == 'Green'){
      return Colors.green;
    }else if(value == 'Red'){
      return Colors.red;
    }else if(value == 'Blue'){
      return Colors.blue;
    }
    else if(value == 'Yellow'){
      return Colors.yellow;
    }
    return null;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }


  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder:(_) => screen),
    );
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
}
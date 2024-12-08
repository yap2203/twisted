import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TDeviceUtils{
  static void hideKeyboard(BuildContext  context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async{
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static double getAppBarHeight(){
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight(){
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }


}
import 'package:flutter/material.dart';
import 'package:Twisted/utils/constants/colors.dart';
import 'package:Twisted/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:Twisted/utils/theme/custom_themes/text_theme.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: TColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: TColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
  );
}
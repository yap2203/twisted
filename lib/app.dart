import 'package:Twisted/bindings/general_bindings.dart';
import 'package:Twisted/utils/constants/colors.dart';
import 'package:Twisted/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primaryBackground, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }


}
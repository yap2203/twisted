import 'dart:async';
import 'dart:math';

import 'package:Twisted/common/widgets/success_screen/success_screen.dart';
import 'package:Twisted/utils/constants/image_strings.dart';
import 'package:Twisted/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/respositories/authentication/authentication_repository.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();



  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// Send Email verification link
sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
}

  /// Set Timer
setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
     await FirebaseAuth.instance.currentUser?.reload();
     final user = FirebaseAuth.instance.currentUser;
     if(user?.emailVerified ?? false){
       timer.cancel();
       Get.off(() =>
           SuccessScreen(
             image: TImages.verifySuccess,
             title: TTexts.yourAccountCreatedTitle,
             subTitle: TTexts.yourAccountCreatedSubTitle,
             onPressed: () =>
                 AuthenticationRepository.instance.screenRedirect(),)
       );
     }
    }
    );
}
  /// Manually check if email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() =>
          SuccessScreen(
            image: TImages.verifySuccess,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect(),)
      );
    }
  }
}
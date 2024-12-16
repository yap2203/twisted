import 'package:Twisted/data/repositories/authentication/authentication_repository.dart';
import 'package:Twisted/features/personalization/controllers/user_controller.dart';
import 'package:Twisted/utils/constants/image_strings.dart';
import 'package:Twisted/utils/popups/full_screen_loader.dart';
import 'package:Twisted/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/network/network_manager.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());




  Future<void> emailAndPasswordSignIn() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me Is Selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(),password.text.trim());

      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  Future<void> googleSignIn() async{
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //Save user record
      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}
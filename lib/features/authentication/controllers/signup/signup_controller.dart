import 'package:Twisted/features/authentication/screens/signup/verify_email.dart';
import 'package:Twisted/utils/constants/image_strings.dart';
import 'package:Twisted/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

void signup() async {
    try {
      ///Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...',TImages.docerAnimation);
      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form Validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if(!privacyPolicy.value){
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Accept Privacy Policy',message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

        /// Show Success
        TLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify email to continue.');

        ///Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
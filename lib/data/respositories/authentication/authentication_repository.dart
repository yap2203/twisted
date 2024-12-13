import 'package:Twisted/features/authentication/screens/login/login.dart';
import 'package:Twisted/features/authentication/screens/onboarding/onboarding.dart';
import 'package:Twisted/features/authentication/screens/signup/verify_email.dart';
import 'package:Twisted/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
final deviceStorage = GetStorage();
final _auth = FirebaseAuth.instance;

@override
  void onReady(){
  FlutterNativeSplash.remove();
  screenRedirect();
}

  screenRedirect() async{
    final user = _auth.currentUser;
  if(user !=null){
    if(user.emailVerified){
      Get.offAll(()=> const NavigationMenu());
    }else{
      Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email,));
    }
  }else{
    // Local Storage
    // if(kDebugMode){
    //   print('===================GET STORAGE================');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}


  /* ----------------------------------------- Email & Password Sign in ------------------------------*/

/// Sign In


/// Register
Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
  try{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch (_){
    throw const TFormatException();
  }on PlatformException catch (e){
    throw TPlatformException(e.code).message;
  }catch (e){
    throw 'Something went wrong. Please try again!';
  }
}

/// Mail Verification
Future<void> sendEmailVerification() async{
  try{
    return await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch (_){
    throw const TFormatException();
  }on PlatformException catch (e){
    throw TPlatformException(e.code).message;
  }catch (e){
    throw 'Something went wrong. Please try again!';
  }
}

///ReAuthenticate User


///Forget Password



/* ----------------------------------./end Federated identity & social sign-in -------------------------------------*/

/// Logout User
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again!';
    }
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Twisted/common/widgets/login_signup/social_buttons.dart';
import 'package:Twisted/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:Twisted/utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class SignupScreen extends StatelessWidget{
  const SignupScreen ({super.key});

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed:() => Get.offAll(()=> const LoginScreen()), icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              TSocialButtons(),


            ],
          ),
        ),
      ),
    );
  }
}


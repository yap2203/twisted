import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Twisted/features/authentication/screens/signup/signup.dart';
import 'package:Twisted/navigation_menu.dart';

import 'package:Twisted/utils/constants/text_strings.dart';
import 'package:Twisted/utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget{
  const TLoginForm({
    super.key,
});

  @override
  Widget build(BuildContext context){
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children:[
          ///Email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Password
          TextFormField(
            decoration:const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const  SizedBox(height: TSizes.spaceBtwInputFields / 2),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              /// Remember Me
              Row(
                children:[
                  Checkbox(value:true,onChanged:(value){}),
                  const Text(TTexts.rememberMe),
                ],
              ),

              /// Forget Password
              TextButton(onPressed:(){},child:const Text(TTexts.forgetPassword),)
            ],
          ),
          const SizedBox(height:TSizes.spaceBtwInputFields),

          /// Sign In Button
          SizedBox(width:double.infinity,child:ElevatedButton(onPressed: () => Get.to(()=> const NavigationMenu()), child:const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Create Account Button
          SizedBox(width: double.infinity,child: OutlinedButton(onPressed:()=> Get.to(() => const SignupScreen()),child:const Text(TTexts.createAccount))),


        ],
      ),
    ));
  }
}
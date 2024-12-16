import 'package:Twisted/features/authentication/controllers/login/login_controller.dart';
import 'package:Twisted/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Twisted/features/authentication/screens/signup/signup.dart';
import 'package:Twisted/utils/constants/text_strings.dart';
import 'package:Twisted/utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget{
  const TLoginForm({
    super.key,
});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children:[
          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validateEmptyText('Password', value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
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
                  Obx(() =>  Checkbox(value:controller.rememberMe.value , onChanged:(value) => controller.rememberMe.value = !controller.rememberMe.value)),
                  const Text(TTexts.rememberMe),
                ],
              ),

              /// Forget Password
              TextButton(onPressed:(){},child:const Text(TTexts.forgetPassword),)
            ],
          ),
          const SizedBox(height:TSizes.spaceBtwInputFields),

          /// Sign In Button
          SizedBox(width:double.infinity,child:ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child:const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Create Account Button
          SizedBox(width: double.infinity,child: OutlinedButton(onPressed:()=> Get.to(() => const SignupScreen()),child:const Text(TTexts.createAccount))),


        ],
      ),
    ));
  }
}
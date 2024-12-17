import 'package:Twisted/common/widgets/appbar/appbar.dart';
import 'package:Twisted/common/widgets/images/t_circular_image.dart';
import 'package:Twisted/common/widgets/texts/section_heading.dart';
import 'package:Twisted/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:Twisted/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      /// -- Body
      body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Profile picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      print('Network Image URL: $networkImage');
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80,radius: 80,)
                          : TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(onPressed: ()=> controller.uploadUserProfilePicture(), child: Text('Change Profile Picture')),
                ],
              ),
            ),

            /// Details
            SizedBox(height: TSizes.spaceBtwItems / 2,),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems,),
            TSectionHeading(title: 'Profile Information', showActionButton: false,),
            SizedBox(height: TSizes.spaceBtwItems,),

            /// Heading Profile Info
            TProfileMenu(onPressed: () {}, title: 'Name', value: 'HeloHelo',),
            TProfileMenu(onPressed: () {}, title: 'username', value: 'hihi',),

            SizedBox(height: TSizes.spaceBtwItems),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Heading Personal Info
            TSectionHeading(title: 'Personal Information', showActionButton: false,),
            SizedBox(height: TSizes.spaceBtwItems,),

            TProfileMenu(onPressed: () {}, title: 'UserId', value: '45689', icon: Iconsax.copy,),
            TProfileMenu(onPressed: () {}, title: 'E-mail', value: 'yyzheng00321@gmail.com'),
            TProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+6018-318-3282'),
            TProfileMenu(onPressed: () {}, title: 'Gender', value: 'M'),
            TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '20 March, 2005'),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems,),

            Center(
              child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red)),
              ),
            )

          ],
        ),
        ),
      ),
    );
  }
}


import 'package:Twisted/data/repositories/user/user_repository.dart';
import 'package:Twisted/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/cloudinary_service.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;

  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }


  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      //Refresh
      await fetchUserRecord();
      if(user.value.id.isEmpty){
      if(userCredentials != null) {
        //Convert name to first and last name
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(
            userCredentials.user!.displayName);

        //Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
        }
      }
    } catch(e){
      TLoaders.warningSnackBar(title: 'Data not saved',
      message: 'Something went wrong while saving your information, You can re-save your data in your Profile.'
      );
    }
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage(
            'Users/Images/Profile/', image);

        //Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    }
    catch (e){
      TLoaders.errorSnackBar(title: 'OhSnap',message: 'Something went wrong : $e');
    }finally{
      imageUploading.value = false;
    }
  }
}
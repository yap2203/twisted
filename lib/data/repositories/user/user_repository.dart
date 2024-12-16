

import 'dart:convert';
import 'dart:io';

import 'package:Twisted/data/repositories/authentication/authentication_repository.dart';
import 'package:Twisted/features/authentication/models/user_model.dart';
import 'package:Twisted/utils/exceptions/firebase_exceptions.dart';
import 'package:Twisted/utils/exceptions/format_exceptions.dart';
import 'package:Twisted/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final authUser = AuthenticationRepository.instance.authUser;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(
          updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }


  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(
          AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  /// Upload any image to Cloudinary
  Future<String> uploadImage(String path, XFile image) async {
    try {
      // Cloudinary upload URL
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';

      String folderPath = 'Users/Images/Profile/';
      var uri = Uri.parse(
          "https://api.cloudinary.com/v1_1/$cloudName/image/upload");

      // Prepare the request
      var request = http.MultipartRequest("POST",uri);
      var fileBytes = await File(image.path).readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: image.name,
      );

      request.fields['upload_preset'] = "twisted";
      request.fields['resource_type'] = 'image'; // For image files
      request.fields['folder'] = folderPath;

      // Add the file to the request
      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        String imageUrl = data['secure_url']; // URL of the uploaded image

        print('Image uploaded successfully! URL: $imageUrl');
        return imageUrl;
      } else {
        throw Exception('Failed to upload image');
      }
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}



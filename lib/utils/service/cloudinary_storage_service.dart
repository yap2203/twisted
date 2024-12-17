import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class TCloudinaryStorageService extends GetxController {
  static TCloudinaryStorageService get instance => Get.find();

  ///Upload Local Assets from IDE
  ///Returns a Uint8List contain image data.
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
      String folderPath = path;
      var uri =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        image,
        filename: name,
      );

      request.fields['upload_preset'] = "twisted";
      request.fields['resource_type'] = 'image'; // For image files
      request.fields['folder'] = folderPath;
      // Add the file to the request
      request.files.add(multipartFile);
      // Send the request
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        String imageUrl = data['secure_url']; // URL of the uploaded image

        print('Image uploaded successfully! URL: $imageUrl');
        return imageUrl;
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  Future<String> uploadImageFile(String path, XFile image) async{
    try{
      String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
      String uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? '';

      var fileBytes = await image.readAsBytes();
      var uri =
      Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
      var request = http.MultipartRequest("POST", uri);
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: image.name,
      );

      // Add other required fields
      request.fields['upload_preset'] = uploadPreset; // Pre-configured preset
      request.fields['folder'] = path; // Cloudinary folder path
      request.files.add(multipartFile);

      var response = await request.send();

      // Process the response
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);

        // Extract and return the secure URL
        String imageUrl = data['secure_url'];
        print('Image uploaded successfully: $imageUrl');
        return imageUrl;
      } else {
        // Handle errors
        throw Exception('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw 'Something went wrong while uploading the image: $e';
    }
  }
}
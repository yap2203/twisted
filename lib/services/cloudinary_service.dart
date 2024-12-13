import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart'as http;

Future<bool> uploadToCloudinary(FilePickerResult? filePickerResult) async{
  if(filePickerResult == null || filePickerResult.files.isEmpty){
    print("No Files Selected!");
    return false;
  }

  File file = File(filePickerResult.files.single.path!);

  String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
  var uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
  var request = http.MultipartRequest("POST",uri);

  var fileBytes = await file.readAsBytes();

  var multipartFile = http.MultipartFile.fromBytes(
    'file',
    fileBytes,
    filename: file.path.split("/").last,
  );

  request.files.add(multipartFile);

  request.fields['upload_preset'] = "twisted";
  request.fields['resource_type'] = "raw";

  var response = await request.send();

  var responseBody = await response.stream.bytesToString();

  print(responseBody);

  if(response.statusCode == 200){
    print("Uploaded successful");
    return true;
  } else {
    print("Upload failed with status: ${response.statusCode}");
    return false;
  }

}
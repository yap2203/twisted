import 'package:Twisted/services/cloudinary_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadArea extends StatefulWidget {
  const UploadArea({super.key});

  @override
  State<UploadArea> createState() => _State();
}

class _State extends State<UploadArea> {
  @override
  Widget build(BuildContext context) {
    final selectedFile =
        ModalRoute.of(context)!.settings.arguments as FilePickerResult;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Area"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              initialValue: selectedFile.files.first.name,
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: selectedFile.files.first.extension,
              decoration: const InputDecoration(
                label: Text("Extention"),
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: "${selectedFile.files.first.size} bytes. ",
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                ),
                const SizedBox(width: 25),
                Expanded(
                    child:
                        ElevatedButton(onPressed: () async{
                          final result = await uploadToCloudinary(selectedFile);

                          if(result){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("File Uploaded Successfully")));
                            Navigator.pop(context);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cannot Upload Your File")));
                          }
                        }, child: const Text('Upload')))
              ],
            )
          ],
        ),
      ),
    );
  }
}

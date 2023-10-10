import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class Firestorage extends StatefulWidget {
  const Firestorage({super.key});

  @override
  State<Firestorage> createState() => _FirestorageState();
}

class _FirestorageState extends State<Firestorage> {
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => upload('camera'),
                  icon: Icon(Icons.camera),
                  label: Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () => upload('gallery'),
                  icon: Icon(Icons.photo),
                  label: Text("Gallery"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> upload(String imagesource) async {
    final imagepicker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await imagepicker.pickImage(
        source:
            imagesource == 'camera' ? ImageSource.camera : ImageSource.gallery,
      );
      final String filename = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path); //import dart.io
      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'uploadedby': 'its me',
              'description': 'some description',
            }));
        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}

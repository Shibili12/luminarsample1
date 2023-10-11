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
            Expanded(
              child: FutureBuilder(
                future: loadMedia(),
                builder: ((context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(image['imageurl']),
                            title: Text(image['uploadedby']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => deleteMedia(image['path']),
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
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
              //meta data
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

  Future<List<Map<String, dynamic>>> loadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (singlefile) async {
      final String url = await singlefile.getDownloadURL();
      final FullMetadata metadata = await singlefile.getMetadata();
      images.add({
        'imageurl': url,
        'path': singlefile.fullPath,
        'uploadedby': metadata.customMetadata?['uploadedby'] ?? 'Nodata',
        'description': metadata.customMetadata?['description'] ?? 'nodata',
      });
    });
    return images;
  }

  Future<void> deleteMedia(String imagepath) async {
    await storage.ref(imagepath).delete();
    setState(() {});
  }
}

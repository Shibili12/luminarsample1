import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: Permissionexample(),
  ));
}

class Permissionexample extends StatefulWidget {
  const Permissionexample({super.key});

  @override
  State<Permissionexample> createState() => _PermissionexampleState();
}

class _PermissionexampleState extends State<Permissionexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: requestCameraPermission,
              child: Text("request camera permission"),
            ),
            ElevatedButton(
              onPressed: requestMultiplePermission,
              child: Text("request multiple permission"),
            ),
            ElevatedButton(
              onPressed: requestPermissionWithopensettings,
              child: Text("request open permission"),
            ),
          ],
        ),
      ),
    );
  }

  void requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      ImagePicker picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
      print("permission is granted");
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("access denied")));
      if (await Permission.camera.request().isGranted) {
        print("permission is Granted");
      }
    }
  }

  void requestMultiplePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.photos,
    ].request();
    print("local permission:${statuses[Permission.location]},"
        "storage permision:${statuses[Permission.storage]}");
  }

  void requestPermissionWithopensettings() async {
    openAppSettings();
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/database/hivedb.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/models/usermodel.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/screens/home_page.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/screens/registration.dart';

// void main() async {
//   WidgetsFlutterBinding
//       .ensureInitialized(); //to connnet widget tree to flutter engine
//   await Hive.initFlutter(); //to initialize hive in flutter
//   // Hive.registerAdapter();
//   await Hive.openBox<User>('userdata');
//   runApp(MaterialApp(
//     home: Loginhive(),
//   ));
// }

class Loginhive extends StatelessWidget {
  Loginhive({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernamecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                hintText: "Enter username",
                filled: true,
                fillColor: Colors.green[200],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                hintText: "Enter password",
                filled: true,
                fillColor: Colors.green[200],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
              ),
              onPressed: () async {
                final userlist = await HiveDb.instance.getuser();
                checkLogin(context, userlist);
              },
              child: Text("login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => Regidtrationhive())));
                },
                child: Text(
                  "Not a user? Register",
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext context, List<User> userlist) async {
    final loginuser = usernamecontroller.text.trim();
    final loginpass = passwordcontroller.text.trim();
    bool userfound = false;
    if (loginuser != "" && loginpass != "") {
      await Future.forEach(userlist, (singleuser) {
        if (singleuser.username == loginuser &&
            singleuser.password == loginpass) {
          userfound = true;
        } else {
          userfound = false;
        }
        if (userfound == true) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => Homepagehive(email: loginuser))));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Login success")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("username is not correct")));
        }
      });
    }
  }
}

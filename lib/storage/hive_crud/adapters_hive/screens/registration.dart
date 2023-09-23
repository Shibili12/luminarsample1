import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:luminarsample1/storage/hive_crud/adapters_hive/database/hivedb.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/models/usermodel.dart';
import 'package:luminarsample1/storage/hive_crud/adapters_hive/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //to connnet widget tree to flutter engine
  await Hive.initFlutter(); //to initialize hive in flutter
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userdata');
  runApp(MaterialApp(
    home: Regidtrationhive(),
  ));
}

class Regidtrationhive extends StatelessWidget {
  Regidtrationhive({super.key});

  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usercontroller,
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
            height: 15,
          ),
          TextField(
            controller: passcontroller,
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
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              ///fetch al the users from data
              final userlist = await HiveDb.instance.getuser();
              validatesignup(context, userlist);
            },
            child: Text("Register"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => Loginhive())));
              },
              child: Text("already have account?login")),
        ],
      ),
    );
  }

  void validatesignup(BuildContext context, List<User> userlist) async {
    final username = usercontroller.text.trim();
    final password = passcontroller.text.trim();
    bool userfound = false;
    final validateemail = EmailValidator.validate(username);
    if (username != "" && password != "") {
      if (validateemail == true) {
        await Future.forEach(userlist, (singleuser) {
          if (singleuser.username == username) {
            userfound = true;
          } else {
            userfound = false;
          }
        });
        if (userfound == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Already exist")));
        } else {
          final validatepassword = validatePassword(context, password);
          if (validatepassword == true) {
            final user = User(username: username, password: password);
            await HiveDb.instance.adduser(user);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Loginhive()));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("regiter successfull")));
          }
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("enter valid email")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("field must be not empty")));
    }
  }

  validatePassword(BuildContext context, String password) {
    if (password.length < 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("invalid password")));
      return false;
    } else {
      return true;
    }
  }
}

import 'package:flutter/material.dart';

class Registraion extends StatefulWidget {
  const Registraion({super.key});

  @override
  State<Registraion> createState() => _RegistraionState();
}

class _RegistraionState extends State<Registraion> {
  var formkey = GlobalKey<FormState>();
  bool nopasswordvisiblity1 = true;
  bool nopasswordvisiblity2 = true;

  String? pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hooliesplash.jpg"),
            fit: BoxFit.cover,
            opacity: .2,
          ),
        ),
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register here",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "heading",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "enter name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "Enter your name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (phone) {
                    if (phone!.isEmpty || phone.length < 10) {
                      return "enter valid mobile number";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter phone number",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@gmail.com")) {
                      return "field is empty/invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter email",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (username) {
                    if (username!.isEmpty) {
                      return "field is empty/invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter username",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: nopasswordvisiblity1,
                  validator: (password) {
                    pass = password;
                    if (password!.isEmpty || password.length < 6) {
                      return "password is incorrect";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (nopasswordvisiblity1 == true) {
                            nopasswordvisiblity1 = false;
                          } else {
                            nopasswordvisiblity1 = true;
                          }
                        });
                      },
                      icon: Icon(nopasswordvisiblity1 == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: nopasswordvisiblity2,
                  validator: (confirmpassword) {
                    if (confirmpassword!.isEmpty || pass != confirmpassword) {
                      return "password must be same";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "Confirm password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (nopasswordvisiblity2 == true) {
                            nopasswordvisiblity2 = false;
                          } else {
                            nopasswordvisiblity2 = true;
                          }
                        });
                      },
                      icon: Icon(nopasswordvisiblity2 == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(100, 35)),
                    onPressed: () {
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("enter correct details"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text("register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

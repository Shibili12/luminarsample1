import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luminarsample1/firebaseexample/phoneauthentication/home.dart';

class Loginphoneauth extends StatefulWidget {
  const Loginphoneauth({super.key});

  @override
  State<Loginphoneauth> createState() => _LoginphoneauthState();
}

class _LoginphoneauthState extends State<Loginphoneauth> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text('+91'),
                ),
              ),
              maxLength: 10,
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  ),
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                if (otpVisibility) {
                  verifyOTP();
                } else {
                  loginWithPhone();
                }
              },
              child: Text(
                otpVisibility ? "Verify" : "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential).then((value) {
          print("you logged in successfully");
        });
      },
      verificationFailed: (FirebaseException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: otpController.text,
    );
    await auth.signInWithCredential(credential).then((value) {
      setState(() {
        user = FirebaseAuth.instance.currentUser;
      });
    }).whenComplete(() {
      if (user != null) {
        Fluttertoast.showToast(
          msg: "you are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homephoneauth()));
      } else {
        Fluttertoast.showToast(
          msg: "login failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class Firebasehelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //to logout

  Future<void> logout() async {
    await auth.signOut();
  }
}

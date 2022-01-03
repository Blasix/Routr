import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  final userStream =
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // go to authentication pages (login, register)
      print('User is currently signed out!');
    } else {
      // go to home page
      print('User is signed in!');
    }
  });

  Future<Function> emailRegister(String mail, String passwrd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: passwrd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to create user');
  }

  Future<Function> emailLogin(String mail, String passwrd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: passwrd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    throw Exception('Failed to login user');
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInOperation {
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    //trigged to sign in flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obatin the user information
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //return the new user credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future navigateToLoginPage(
  //     UserCredential userCredential, BuildContext context) async {
  //   final userName = userCredential.user?.email;
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LoginPage(
  //         userName,
  //       ),
  //     ),
  //   );
  // }
  static void lookTheUserAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
class AuthManager {
  IAuthOperation? _iAuthOperation;
  AuthManager(IAuthOperation iAuthOperation){
    this._iAuthOperation=iAuthOperation;
  }
  void createUserEmailAndPassword(String userEmail,String userPassword){
    _iAuthOperation?.createUserEmailAndPassword(userEmail, userPassword);
  }
}

class AuthOperation extends IAuthOperation {
  @override
  createUserEmailAndPassword(String userEmail, String userPassword) async {
    try {

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

    } on FirebaseAuthException catch (e) {

      handleWeekPasswordException(e);
    } catch (e) {

      handleLastCatchException(e);

    }
  }

  void handleLastCatchException(Object e) {
    print(e);
  }

  void handleWeekPasswordException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  }
}

abstract class IAuthOperation {
  createUserEmailAndPassword(String userEmail, String userPassword);
}

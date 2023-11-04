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




import 'package:firebase_digital_workspace/services/service_google.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleSignInOperation googleSignInOperation = new GoogleSignInOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Google Login Page"),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () async {
              final userCredit =
                  await googleSignInOperation.signInWithGoogle(context);
              googleSignInOperation.navigateToLoginPage(userCredit, context);
              GoogleSignInOperation.lookTheUserAuthState();
            },
            child: Row(
              children: [
                Text(
                  "Sign in with google",
                ),
                Icon(Icons.login),
              ],
            ),
          ),
        ));
  }
}
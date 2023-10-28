import 'package:firebase_digital_workspace/services/service_google.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  String? userEmail;
  LoginPage(this.userEmail);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login page"),
        ),
        body: WillPopScope(
          onWillPop: ()async {
            GoogleSignInOperation.lookTheUserAuthState();
            print("User signed out");
            return true;
          },
          child: Column(
            children: [
              Text(widget.userEmail == null ? "Empty name" : widget.userEmail!),
            ],
          ),
        ));
  }
}
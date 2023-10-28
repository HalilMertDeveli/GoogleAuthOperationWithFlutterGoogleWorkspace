import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_digital_workspace/pages/page_home.dart';
import 'package:firebase_digital_workspace/pages/page_login.dart';
import 'package:firebase_digital_workspace/pages/page_splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      home: const SplashScreen(),
    ),
  );
}











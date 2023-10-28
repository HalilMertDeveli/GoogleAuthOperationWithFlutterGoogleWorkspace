import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_digital_workspace/pages/page_home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeFirebaseApp();
  }

  Future<void> initializeFirebaseApp() async {
    await Firebase.initializeApp();
    //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);//i added for local auth emulator suite
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
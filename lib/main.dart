import 'package:firebase_digital_workspace/pages/page_home.dart';
import 'package:firebase_digital_workspace/pages/page_login.dart';
import 'package:firebase_digital_workspace/pages/page_splash.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=>SplashScreen(),
        '/login':(context)=>LoginPage(),
        '/home':(context)=>HomePage(),
      },
    ),
  );
}











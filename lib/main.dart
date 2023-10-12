import 'package:firebase_auth/firebase_auth.dart';
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
            onPressed: ()async {
              final userCredit=await googleSignInOperation.signInWithGoogle(context);
              googleSignInOperation.navigateToLoginPage(userCredit, context);
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
  Future navigateToLoginPage(UserCredential userCredential,BuildContext context)async{
    final userName = userCredential.user?.email;
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userName,),),);
        
        

  }
}

class LoginPage extends StatefulWidget {
 
   String ?userEmail;
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
      body: Column(
        children: [
          Text(widget.userEmail== null ? "Empty name":widget.userEmail!),
        ],
      ),
    );
  }
}

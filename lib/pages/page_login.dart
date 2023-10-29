import 'package:firebase_digital_workspace/pages/page_home.dart';
import 'package:firebase_digital_workspace/services/service_google.dart';
import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   String? userEmail;
//   LoginPage(this.userEmail);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Login page"),
//         ),
//         body: WillPopScope(
//           onWillPop: ()async {
//             GoogleSignInOperation.lookTheUserAuthState();
//             print("User signed out");
//             return true;
//           },
//           child: Column(
//             children: [
//               Text(widget.userEmail == null ? "Empty name" : widget.userEmail!),
//             ],
//           ),
//         ));
//   }
// }

class LoginPage extends StatelessWidget with FormMixin {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  AuthManager authManager = AuthManager(AuthOperation());
  NavigateUser navigateUser = NavigateUser(); 
  UserInformation _userInformation = new UserInformation();

  LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: customDecoration,
              child: TextField(
                controller: _controllerEmail,
              ),
            ),
            Container(
              decoration: customDecoration,
              child: TextField(
                controller: _controllerPassword,
              ),
            ),
            ElevatedButton(
              onPressed: () {
               authManager.createUserEmailAndPassword(
                  _controllerEmail.text.toString(),
                  _controllerPassword.text.toString(),
                );
                navigateUser.navigateWithInformation('/home', context, _userInformation.getLoggedInformation());
                //navigateUser.navigateUserWithoutPop(HomePage(), context);
                

                // print(credential.user?.email);
                // print(credential.user?.phoneNumber);
                // print(credential.user?.uid);
              },
              child: Row(
                children: [Icon(Icons.add)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin class FormMixin {
  BoxDecoration get customDecoration => BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      );
}

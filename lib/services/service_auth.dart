import 'package:firebase_auth/firebase_auth.dart';

class UserInformationModel{
  final String? userEmail;
   final String? userUid;
   final String? userName;

  UserInformationModel({required this.userEmail, required this.userUid, required this.userName});
}




class AuthManager {
  IAuthOperation? _iAuthOperation;
  AuthManager(IAuthOperation iAuthOperation) {
    this._iAuthOperation = iAuthOperation;
  }
  void createUserEmailAndPassword(String userEmail, String userPassword) {
    _iAuthOperation?.createUserEmailAndPassword(userEmail, userPassword);
  }
}


class AuthOperation extends IAuthOperation {
  void getUserInformation(){

       FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          final userUid=user.uid;
          final userEmail=user.email;
          final userDisplayName= user.displayName;
          final userInformationModelInstance = UserInformationModel(userEmail: userEmail, userUid: userUid, userName: userDisplayName);


        }else{
          print("There is problem in here");
        }
      });
    }
  
  @override
  void createUserEmailAndPassword(String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      getUserInformation();
      
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

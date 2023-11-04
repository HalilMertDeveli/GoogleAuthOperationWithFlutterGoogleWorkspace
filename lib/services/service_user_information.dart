import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserInformation{
  Map<dynamic,dynamic> getLoggedInformation();
}
class UserInformation extends IUserInformation{
  @override
  Map getLoggedInformation() {
    Map informationMap = Map();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          informationMap['uid']=user.uid;
          informationMap['email']=user.email;
          informationMap['displayName']= user.displayName;
          
        }
      
      });
    return informationMap;
  }

}

import 'package:flutter/material.dart';

abstract class IServiceNavigation {
  navigateUserWithPop(Widget pageName, BuildContext context);
  navigateUserWithoutPop(Widget pageName, BuildContext context);
}

class ServiceNavigation extends IServiceNavigation {
  @override
  navigateUserWithPop(Widget pageName, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ),
    );
  }

  @override
  navigateUserWithoutPop(Widget pageName, BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ),
    );
  }
  navigateWithInformation(String stringPathNameForScrren, BuildContext context,Map informationToCarry){
    Navigator.pushNamed(context, stringPathNameForScrren,arguments: informationToCarry);
  }
}
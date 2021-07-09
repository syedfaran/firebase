import 'package:database/constants.dart';
import 'package:database/firebaseRepo.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  final FirebaseRepo firebaseRepo = FirebaseRepo();
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text('Logout',style: Constants.regularHeading,),
      onPressed: ()async{
        await firebaseRepo.signOut();
      },
    );
  }
}

import 'package:database/constants.dart';
import 'package:database/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<FirebaseApp>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: pro == null
          ? Center(
            child: Text(
                'Initializing App....',
                style: Constants.regularHeading,
              ),
          )
          : SafeArea(child: Wrapper()),
    );
  }
}

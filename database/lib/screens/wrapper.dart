import 'package:database/screens/home_page.dart';
import 'package:database/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<User>(context);
    return pro==null?LoginPage():HomePage();
  }
}

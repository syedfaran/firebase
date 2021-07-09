import 'package:database/constants.dart';
import 'package:database/firebaseRepo.dart';
import 'package:database/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MainTitle(),
        AspectRatio(
          aspectRatio: 8 / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EmailTextField(),
              PasswordTextField(),
              CusButtonTwo(),
            ],
          ),
        ),
        CusButton(),
      ],
    ));
  }
}
////////////////////////////////////////////////////////////////////

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<FormProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: TextField(
          onChanged: pro.setEmail,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email or Phone Number',
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<FormProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: TextField(
          onChanged: pro.setPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
          ),
        ),
      ),
    );
  }
}

class CusButton extends StatelessWidget {
  const CusButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<NavigationState>(context);
    return InkWell(
      onTap: pro.changeState,
      child: Container(
        height: 60,
        width: 350,
        child: Center(
            child: Text(
                pro.toggle ? 'Create New Account' : 'Back To Login Page',
                style: Constants.regularHeading)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              style: BorderStyle.solid, color: Colors.black, width: 3),
        ),
      ),
    );
  }
}

class CusButtonTwo extends StatelessWidget {
  final FirebaseRepo _repo = FirebaseRepo();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<NavigationState>(context);
    final p = Provider.of<FormProvider>(context);
    return InkWell(
      onTap: pro.toggle
          ? () async {
              await _repo.signInWithEmailPassword(p.email, p.password);
            }
          : () async {
              await _repo.createUser(p.email, p.password);
            },
      child: Container(
        height: 60,
        width: 350,
        child: Center(
            child: Text(pro.toggle ? 'Login' : 'Create Account',
                style: Constants.regularHeading)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              style: BorderStyle.solid, color: Colors.black, width: 3),
        ),
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<NavigationState>(context);
    return Text(
      pro.toggle
          ? 'Welcome User \n Login To Your Account'
          : 'Create New Account',
      style: Constants.boldHeading,
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social/screens/auth/signup.dart';
import 'package:social/screens/layout.dart';
import 'package:social/services/auth.dart';
import 'package:social/widgets/signin_signUp.dart';

import '../../widgets/textfield.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    authFire authMethods = authFire();
    String res = await authMethods.signIn(
      email: usernameController.text,
      password: passwordController.text,
    );
    if (res == 'correct') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => layOutPage(),
          ));
    } else {
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      mainButtonText: 'Sign In',
      switchText: 'Don\'t have an account',
      switchButtonText: 'Sign up now',
      onMainButtonPressed: () {
        signIn();
      },
      onSwitchButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignUp();
        }));
      },
      additionalFields: [
        Textbox(
          hinttext: 'Enter your Email for sign in',
          textboxicon: Icons.email_outlined,
          controller: usernameController,
        ),
        Textbox(
          hinttext: 'Enter your password for sign in',
          textboxicon: Icons.lock,
          controller: passwordController,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

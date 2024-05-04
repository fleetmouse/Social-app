import 'package:flutter/material.dart';
import 'package:social/screens/auth/signup.dart';
import 'package:social/widgets/signin_signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return AuthPage(
      mainButtonText: 'Login',
      switchText: 'Don\'t have an account?',
      switchButtonText: 'Sign up now',
      onMainButtonPressed: () {},
      onSwitchButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
      usernameHintText: 'Enter your username',
      passwordHintText: 'Enter your password',
    );
  }
}

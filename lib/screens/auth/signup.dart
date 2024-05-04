import 'package:flutter/material.dart';
import 'package:social/widgets/signin_signUp.dart';
import 'package:social/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return AuthPage(
      mainButtonText: 'Sign Up',
      switchText: 'Have an account',
      switchButtonText: 'Sign in now',
      onMainButtonPressed: () {},
      onSwitchButtonPressed: () {},
      usernameHintText: 'Enter your username for sign up',
      passwordHintText: 'Enter your password for sign up',
      additionalFields: const [
        Textbox(
          hinttext: 'Enter your display name',
          textboxicon: Icons.person,
        ),
        Textbox(
          hinttext: 'Enter your email',
          textboxicon: Icons.email,
        ),
      ],
    );
  }
}

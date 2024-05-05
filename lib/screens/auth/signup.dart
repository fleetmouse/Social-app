import 'package:flutter/material.dart';
import 'package:social/screens/auth/login_page.dart';
import 'package:social/services/auth.dart';
import 'package:social/widgets/signin_signUp.dart';
import 'package:social/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final displayNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  register() async {
    authFire authMethods = authFire();
    String res = await authMethods.signUp(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        displayName: displayNameController.text);
    if (res == 'correct') {
    } else {
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPage(
      mainButtonText: 'Sign Up',
      switchText: 'Have an account',
      switchButtonText: 'Sign in now',
      onMainButtonPressed: () {
        register();
      },
      onSwitchButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      },
      additionalFields: [
        Textbox(
          hinttext: 'Enter your display name',
          textboxicon: Icons.person,
          controller: displayNameController,
        ),
        Textbox(
          hinttext: 'Enter your username for sign up',
          textboxicon: Icons.person_outline,
          controller: usernameController,
        ),
        Textbox(
          hinttext: 'Enter your email',
          textboxicon: Icons.email,
          controller: emailController,
        ),
        Textbox(
          hinttext: 'Enter your password for sign up',
          textboxicon: Icons.lock,
          controller: passwordController,
          // add the password view here so the user can hide and show the password
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    displayNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

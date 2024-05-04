import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social/colors.dart';
import 'package:social/widgets/textfield.dart';

class AuthPage extends StatelessWidget {
  final String mainButtonText;
  final String switchText;
  final String switchButtonText;
  final VoidCallback onMainButtonPressed;
  final VoidCallback onSwitchButtonPressed;
  final List<Widget>?
      additionalFields; // This is the new parameter to add text fields
  final String usernameHintText;
  final String passwordHintText;

  const AuthPage(
      {Key? key,
      required this.mainButtonText,
      required this.switchText,
      required this.switchButtonText,
      required this.onMainButtonPressed,
      required this.onSwitchButtonPressed,
      this.additionalFields, // This is the new parameter
      required this.usernameHintText, // Add this line
      required this.passwordHintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/scholarly-logo1.png',
                height: 250,
                width: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'omar social',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '09',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: kprimecolor,
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Textbox(
                hinttext: usernameHintText,
                textboxicon: Icons.email_outlined,
              ),

              Textbox(
                hinttext: passwordHintText,
                textboxicon: Icons.lock,
              ),
              if (additionalFields != null)
                ...additionalFields!, // This line adds the additional fields to the widget tree

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onMainButtonPressed,
                      child: Text(
                        mainButtonText,
                        style: TextStyle(color: kwhitecolor),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kprimecolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(switchText),
                  Gap(10),
                  GestureDetector(
                    onTap: onSwitchButtonPressed,
                    child: Text(
                      switchButtonText,
                      style: TextStyle(color: kprimecolor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

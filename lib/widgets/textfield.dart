import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social/colors.dart';

class Textbox extends StatefulWidget {
  final String hinttext;
  final IconData textboxicon;
  final TextEditingController controller;
  //final TextInputType keyboardType; // TODO: Add keyboardType to Textbox

  // const
  const Textbox({
    required this.hinttext,
    required this.textboxicon,
    required this.controller,
    //this.keyboardType = TextInputType.text,
  });

  @override
  _TextboxState createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.textboxicon),
            hintText: widget.hinttext,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: kwhitecolor,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: kprimecolor,
              ),
            ),
          ),
        ),
        Gap(15), // Add this line
      ],
    );
  }
}

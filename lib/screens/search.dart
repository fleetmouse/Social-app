import 'package:flutter/material.dart';
import 'package:social/colors.dart';

class SocialSearch extends StatefulWidget {
  const SocialSearch({super.key});

  @override
  State<SocialSearch> createState() => _SocialSearchState();
}

class _SocialSearchState extends State<SocialSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimecolor,
      appBar: AppBar(),
      body: Center(
        child: Text('seacrhPage'),
      ),
    );
  }
}

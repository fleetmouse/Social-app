import 'package:flutter/material.dart';
import 'package:social/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimecolor,
      appBar: AppBar(),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
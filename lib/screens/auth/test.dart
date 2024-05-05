import 'package:flutter/material.dart';

class testPage extends StatefulWidget {
  const testPage({super.key});

  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Center(
            child: Text('this is a test '),
          ),
          ElevatedButton(onPressed: () {}, child: Text('press me '))
        ],
      ),
    );
  }
}

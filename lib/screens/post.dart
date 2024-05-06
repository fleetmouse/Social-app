import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social/colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitecolor,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: Text('Add Post'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('Post'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon.png'),
                  ),
                  Gap(30),
                  Expanded(
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type here ..... ",
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: ksecoundcolor,
                  //minimumSize: Size(100, 100),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: kwhitecolor,
                ),
              ),
              Gap(50),
            ],
          ),
        ));
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social/colors.dart';
import 'package:social/services/cloud.dart';
import 'package:social/util/picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Uint8List? file;
  TextEditingController descriptioncon = TextEditingController();
  uploadPost() async {
    try {
      String res = await cloudMethods().uploadPost(
        description: descriptioncon.text,
        uid: 'KQLaJIq6GPU6ZqvozB5pxMCezD23',
        postId: '',
        username: 'fleet',
        file: file!,
        displayName: 'omar',
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitecolor,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: Text('Add Post'),
          actions: [
            TextButton(
              onPressed: () {
                uploadPost();
              },
              child: Text('Post'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon.png'),
                  ),
                  Gap(30),
                  Expanded(
                    child: TextField(
                      controller: descriptioncon,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type here ..... ",
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: file == null
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              image:
                                  DecorationImage(image: MemoryImage(file!))),
                        )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: ksecoundcolor,
                  //minimumSize: Size(100, 100),
                ),
                onPressed: () async {
                  Uint8List myfile =
                      await pickImage(); // we cant use the await inside the set state >
                  setState(() {
                    file = myfile;
                  });
                },
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text.rich(
            //we use text.rich so we can have accses to text span and do multible text style at the same time
            TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: ' Omar  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Social',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kprimecolor,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
          ],
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/icon.png'),
                        ),
                        Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('name'),
                            Text('username'),
                          ],
                        ),
                        Spacer(),
                        Text('demo date')
                      ],
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/icon.png'),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'data',
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline),
                        ),
                        Text('0'),
                        Gap(20),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.comment),
                        ),
                        Text('0'),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

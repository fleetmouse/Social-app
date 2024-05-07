import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:social/colors.dart';

class HomeCard extends StatefulWidget {
  final dynamic doc;
  HomeCard({Key? key, required this.doc}) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
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
                widget.doc['profilePicture'] == ""
                    ? CircleAvatar(
                        backgroundImage: AssetImage('assets/images/icon.png'),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.doc['profilePicture']),
                      ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.doc['displayName']),
                    Text(widget.doc['username']),
                  ],
                ),
                Spacer(),
                Text(DateFormat('yyyy-MM-dd – kk:mm').format(widget.doc['date']
                    .toDate())) // Foramt the date using intel package
              ],
            ),
            Row(children: [
              Expanded(
                child: widget.doc['postimage'] != ""
                    ? Container(
                        margin:
                            EdgeInsets.all(12), // create a space around the pic
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(widget.doc['postimage']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.doc['description'],
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  // move it alone :) so not the whole page refresh
                  onPressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: _isPressed ? Colors.red : Colors.black,
                  ),
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
  }
}

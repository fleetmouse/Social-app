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
        appBar: AppBar(
          title: Text('find users'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBar(
                trailing: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_off_outlined,
                      color: kprimecolor,
                    ),
                  )
                ],
                hintText: 'Search by user name',
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => kwhitecolor),
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    side: BorderSide(color: kprimecolor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile();
                  },
                ),
              )
            ],
          ),
        ));
  }
}

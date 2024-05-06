import 'package:flutter/material.dart';
import 'package:social/colors.dart';
import 'package:social/screens/home.dart';
import 'package:social/screens/post.dart';
import 'package:social/screens/profile.dart';
import 'package:social/screens/search.dart';

class layOutPage extends StatefulWidget {
  const layOutPage({super.key});

  @override
  State<layOutPage> createState() => _layOutPageState();
}

class _layOutPageState extends State<layOutPage> {
  PageController pagcon = PageController();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //pages for the nav bar
        controller: pagcon,
        children: [
          HomeScreen(),
          AddPage(),
          SocialSearch(),
          ProfileScreen(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
            pagcon.jumpToPage(index);
          });
        },
        elevation: 0,
        selectedIndex: _currentIndex,
        indicatorColor: kprimecolor.withOpacity(0.06),
        backgroundColor: kwhitecolor.withOpacity(0.2),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home_outlined,
              color: kprimecolor,
            ),
          ),
          NavigationDestination(
              icon: Icon(Icons.add_outlined),
              label: 'Add',
              selectedIcon: Icon(
                Icons.add_outlined,
                color: kprimecolor,
              )),
          NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
              selectedIcon: Icon(
                Icons.search_outlined,
                color: kprimecolor,
              )),
          NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
              selectedIcon: Icon(
                Icons.person_outlined,
                color: kprimecolor,
              )),
        ],
      ),
    );
  }
}

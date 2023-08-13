import 'package:chat_application/constants.dart';
import 'package:chat_application/pages/home_page.dart';
import 'package:chat_application/pages/sections.dart';
import 'package:chat_application/pages/profile.dart';

import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  bool loading = false;
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const All(),
    const ProfileScreen(),
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  //   successStories = await ApiProvider().getStories();
  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.blue,
              )
            : screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: kPrimaryColorOrange,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Desserts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

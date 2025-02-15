import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Page22.dart';

class BottomnavigationbarClass extends StatefulWidget {
  const BottomnavigationbarClass({super.key});

  @override
  State<BottomnavigationbarClass> createState() => _BottomnavigationbarClassState();
}

class _BottomnavigationbarClassState extends State<BottomnavigationbarClass> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8,),
      child: BottomNavigationBar(
        elevation: 9,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.indigo,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedLabelStyle: const TextStyle(color: Colors.indigo),
        selectedLabelStyle: const TextStyle(color: Colors.orangeAccent),
        type: BottomNavigationBarType.fixed,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill,),
            label: 'Application',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.compass_fill,),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_rounded,),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_rounded,),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,),
            label: 'Setting',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder:(context)=> const Page22()));
          } else if (index == 1) {
            // Handle Discover icon tap
          } else if (index == 2) {
            // Handle Community icon tap
          } else if (index == 3) {
            // Handle Bookmarks icon tap
          } else if (index == 4) {
            // Handle Setting icon tap
          }
        },
        // backgroundColor: Colors.white54,
      ),
    );
  }
}

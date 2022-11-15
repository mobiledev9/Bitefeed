import 'package:bitefeed/camera_screen.dart';
import 'package:bitefeed/chat_screen.dart';
import 'package:bitefeed/setting_screen.dart';
import 'package:flutter/material.dart';

import 'bitefeed.dart';
import 'home_screen.dart';

class BottamBar extends StatefulWidget {
  const BottamBar({super.key});

  @override
  State<BottamBar> createState() => _BottamBarState();
}

class _BottamBarState extends State<BottamBar> {
  List page = const [
    MyHomeScreen(),
    BiteFeed(),
    ChatScreen(),
    SettingScreen(),
    CameraScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
        var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.photo_camera_outlined,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              currentIndex = 4;
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: page[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment. spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.local_cafe_outlined,
                  size: 30,
                  color: currentIndex == 0 ? Colors.blue : Colors.black,
                )),
               
            Padding(
              padding:  EdgeInsets.only(right: width*0.15),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.local_dining_outlined,
                    size: 30,
                    color: currentIndex == 1 ? Colors.blue : Colors.black,
                  )),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.sms_outlined,
                  size: 30,
                  color: currentIndex == 2 ? Colors.blue : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.room_preferences_outlined,
                  size: 30,
                  color: currentIndex == 3 ? Colors.blue : Colors.black,
                )),
          ],
        ),
      ),

      // type: BottomNavigationBarType.fixed,
      // currentIndex: currentIndex,
      // onTap: (value) {
      //   currentIndex = value;
      //   setState(() {});
      // },
      // backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      // unselectedItemColor: Colors.grey,
      // showSelectedLabels: false, showUnselectedLabels: false,
      // selectedItemColor: Colors.blue,
      // selectedItemColor: Colors.black,
      // showUnselectedLabels: false,
      // showSelectedLabels: false,
      // items: const [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.local_cafe_outlined, size: 32),
      //     label: 'home',
      //   ),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.local_dining_outlined, size: 32),
      //       label: 'file'),
      //   // BottomNavigationBarItem(
      //   //     icon: Icon(Icons.photo_camera_outlined, size: 50), label: 'file'),

      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.sms_outlined, size: 32), label: 'file'),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.room_preferences_outlined, size: 32),
      //       label: 'file'),
      // ],
    );
  }
}

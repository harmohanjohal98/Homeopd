import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/main/screens/ClinicInfo.dart';
import 'package:flutter_app/main/screens/Dashboard.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Profile.dart';

class MWTabBarScreen1 extends StatefulWidget {
  static String tag = "/MWTabBarScreen1";
  static const String routeName = 'mwtabvarscreen1';

  @override
  _MWTabBarScreen1State createState() => _MWTabBarScreen1State();
}

class _MWTabBarScreen1State extends State<MWTabBarScreen1> {
  int _currentIndex = 0;

  final tabs = [Dashboard(), Profile(), ClinicInfo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room),
            title: Text('Appointments'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Patient Profile'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), title: Text('Clinic Info'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

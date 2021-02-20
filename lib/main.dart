import 'package:flutter/material.dart';
import 'package:flutter_app/main/screens/BookAppointment.dart';
import 'package:flutter_app/main/screens/Dashboard.dart';
import 'package:flutter_app/main/screens/Login.dart';
import 'package:flutter_app/main/screens/BottomNavBar.dart';
import 'package:flutter_app/main/screens/UpcomingVisits.dart';
import 'package:flutter_app/main/screens/VisitHistory.dart';
import 'package:flutter_app/main/store/AppStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

AppStore appStore = AppStore();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          VisitHistory.routeName: (context) => VisitHistory(),
          BookAppointment.routeName: (context) => BookAppointment(),
          Dashboard.routeName: (context) => Dashboard(),
          MWTabBarScreen1.routeName: (context) => MWTabBarScreen1(),
          UpcomingVisits.routeName: (context) => UpcomingVisits(),

        },
        home: LoginScreen(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/main/screens/BookAppointment.dart';
import 'package:flutter_app/main/screens/VisitHistory.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:flutter_app/main/main/utils/app_colors.dart';
import 'package:flutter_app/main/main/utils/app_image.dart';
import 'package:flutter_app/main/main/utils/app_strings.dart';

import 'UpcomingVisits.dart';

class Dashboard extends StatefulWidget {
  static var tag = "/Dashboard";
  static const String routeName = 'dashboard';

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  double width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(leading: Text(''),backgroundColor: Colors.black),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'Previous Visits'),
                        Tab(text: 'Upcoming Visits'),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [VisitHistory(), UpcomingVisits()],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            heroTag: '5',
            label: Text(
              "Add",
              style: primaryTextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // ignore: unnecessary_statements
            onPressed: () {
              Navigator.of(context).pushNamed(BookAppointment.routeName);
            }),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Container(
        child: _tabBar,
        margin: EdgeInsets.only(left: 16, right: 16),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

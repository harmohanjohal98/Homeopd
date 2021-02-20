import 'package:flutter/material.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:flutter_app/main/models/T5Models.dart';
import 'package:flutter_app/main/main/utils/app_colors.dart';
import 'package:flutter_app/main/main/utils/app_constant.dart';
import 'package:flutter_app/main/utils/T5DataGenerator.dart';

import '../../main.dart';

class UpcomingVisits extends StatefulWidget {
  static var tag = "/UpcomingVisits";
  static const String routeName = 'upcomingvisits';

  @override
  UpcomingVisitsState createState() => UpcomingVisitsState();
}

class UpcomingVisitsState extends State<UpcomingVisits> {
  int selectedPos = 1;
  List<T5Bill> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //TopBar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: text('Scheduled Visits',
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    text("Feb", fontSize: textSizeSMedium),
                                    text(mListings[index].day,
                                        fontSize: textSizeLargeMedium,
                                        textColor: appStore.textSecondaryColor),
                                  ],
                                ),
                                Container(
                                  decoration: boxDecoration(
                                      radius: 8, showShadow: false),
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  width: width / 7.2,
                                  height: width / 7.2,
                                  padding: EdgeInsets.all(width / 30),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          text('Regular Checkup',
                                              textColor:
                                                  appStore.textPrimaryColor,
                                              fontSize: textSizeMedium,
                                              fontFamily: fontSemibold),
                                          // text(mListings[index].amount,
                                          //     textColor:
                                          //     appStore.textSecondaryColor,
                                          //     fontSize: textSizeMedium,
                                          //     fontFamily: fontSemibold)
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      // text("Mastercard",
                                      //     fontSize: textSizeMedium)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(height: 0.5, color: t5ViewColor)
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

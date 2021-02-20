import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/main/screens/BottomNavBar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_app/main/main/utils/app_constant.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:flutter_app/main/main/utils/app_colors.dart';
import 'package:flutter_app/main/main/utils/app_image.dart';
import 'package:flutter_app/main/main/utils/app_strings.dart';
import 'package:flutter_app/main/main/utils/app_widget.dart';

import '../../main.dart';

class OtpPage extends StatefulWidget {
  static String tag = '/OtpPage';

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                      placeholder: placeholderWidgetFn(),
                      imageUrl: 'assets/images/password.png',
                      width: width / 2.5,
                      height: width / 2.5),
                  SizedBox(height: 30),
                  text(t5_lbl_verification,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 16),
                    child: text(t5_note_verification,
                        textColor: t5TextColorSecondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                        maxLine: 2,
                        isCentered: true),
                  ),
                  Container(
                    margin: EdgeInsets.all(24),
                    decoration: boxDecoration(
                        bgColor: appStore.scaffoldBackground,
                        showShadow: false,
                        radius: 4),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 10),
                        PinEntryTextField(fields: 4, fontSize: textSizeNormal),
                        SizedBox(height: 24),
                        GestureDetector(
                          // onTap: () {
                          //   Dashboard().launch(context);
                          // },
                          child: GestureDetector(
                            onTap: () {
                              // MWTabBarScreen1().launch(context);
                              
                              Navigator.of(context).pushReplacementNamed(MWTabBarScreen1.routeName);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: width / 8,
                              child: text('Continue',
                                  textColor: Colors.black, isCentered: true),
                              decoration: boxDecoration(
                                  bgColor: Colors.grey, radius: 8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toast(t5_resend);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: text(t5_resend,
                          textColor: Colors.black,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontSemibold),
                    ),
                  )
                ],
              ),
            ),
          ),
          // TopBar()
        ],
      ),
    );
  }
}

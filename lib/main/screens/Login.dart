import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:flutter_app/main/utils/country_code_picker.dart';
import 'package:flutter_app/main/screens/OtpPage.dart';
import 'package:flutter_app/main/main/utils/app_colors.dart';
import 'package:flutter_app/main/main/utils/app_constant.dart';
import 'package:flutter_app/main/main/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/LoginScreen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //changeStatusColor(appStore.appBarColor);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Future postData() async {
      Map body = {
        "main_id": "homeopd_regalmojo",
        "method": "signin",
        "userIdentifier": "9815804037",
        "password": "9815804037"
      };
      String url = "https://homeopd.com/webApi/homeopdServer/ksdBackEnd/userApi.php";
      http.Response resp = await http.post(url, body: body);
      // ignore: non_constant_identifier_names
      var Response = jsonDecode(resp.body);
      if (resp.statusCode == 200) {
        var token = Response["data"];
        print(token);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: appStore.scaffoldBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    postData();
                  },
                  child: Text("click me")),
             // CachedNetworkImage(placeholder: placeholderWidgetFn(), imageUrl: t5_ragistration, width: width / 2.5, height: width / 2.5),
              text(t5_heading_login,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: 22.0),
              Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                child: text(t5_note_registration,
                    textColor: t5TextColorSecondary,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                    maxLine: 2,
                    isCentered: true),
              ),
              Container(
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print, showFlag: true),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: TextStyle(
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontRegular),
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: t5_hint_phone_no,
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        OtpPage().launch(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: width / 8,
                        child: text(t5_continue,
                            textColor: t5White, isCentered: true),
                        decoration:
                            boxDecoration(bgColor: Colors.grey, radius: 8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

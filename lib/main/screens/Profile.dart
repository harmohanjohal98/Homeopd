import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main/main/utils/app_constant.dart';
import 'package:flutter_app/main/models/member_profile_modal.dart';
import 'package:flutter_app/main/profile/features_details/feature_details_screen.dart';
import 'package:flutter_app/main/screens/Login.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_app/main/models/quiz_score_data.dart';

class Profile extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List mList;
  List<QuizScoresModel> mList1;
  var index = 0;

  MemberProfileModal memberProfileData;
  String name;
  var dob0;
  var dob;

  int selectedPos = 1;

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    // ignore: deprecated_member_use
    pref.commit();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (route) => false);
  }

  Future<MemberProfileModal> getMemberProfileData(String token) async {
    const String url =
        'https://homeopd.com/webApi/homeopdServer/ksdBackEnd/userApi.php';
    http.Response response = await http.get(Uri.encodeFull(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    print('json String');
    print(response.body);
    print('from json String to Map');
    Map result = json.decode(response.body);
    print(result);

    MemberProfileModal memberProfileDataFromJson;

    setState(() {
      memberProfileDataFromJson = MemberProfileModal.fromJson(result);
    });
    return memberProfileDataFromJson;
  }

  memberProfileInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('preftoken=========================================');
    String apiKey = pref.getString('token');
    //  print('preftoken=========================================Ends');
    getMemberProfileData(
            'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDFlMjhkMWYyOTRjMjJmY2VkNWEwNjMiLCJuZXdEYk5hbWUiOiJkYi0xNjEyNDgxNzgxMTE0IiwiaWF0IjoxNjEyNTkzODYwfQ.0xJuNtULLSyTJh2Na46Z27wvrJa1JRL9DW3JYnQfmO0')
        .then((value) {
      setState(() async {
        memberProfileData = value;

        name = memberProfileData.data.memName;
        dob0 = memberProfileData.data.dOB;
        SharedPreferences memberData = await SharedPreferences.getInstance();
        memberData.setString('memberName', value.data.memName);
        memberData.setString('contact1', value.data.contact);
        memberData.setString('regNo', value.data.chronicNo);

        DateTime dob1 = DateTime.parse(dob0);
        dob = DateFormat.yMd().format(dob1);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    mList1 = quizScoresData();
    selectedPos = 1;
    memberProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    print('id is : ${mList1[0].id}');

    final imgview = name == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      height: width * 0.35,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4)),
                      // child: CircleAvatar(
                      //     backgroundImage: CachedNetworkImageProvider(
                      //         'https://regalmojo.in/gymeDiary/media/profilePicture/${memberProfileData.data.memberDob}'),
                      //     radius: MediaQuery.of(context).size.width / 8.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                            'https://regalmojo.in/gymeDiary/media/profilePicture/${memberProfileData.data.profilePic}'),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.white),
                      child: Icon(Icons.settings),
                    ).paddingOnly(right: 16, top: 16).onTap(() {
                      print("Edit profile");
                    }),
                  ],
                ),
                text('Jonas Kahnwald',
                        // memberProfileData.data.memberName,
                        textColor: Colors.black,
                        fontSize: textSizeLargeMedium,
                        fontFamily: fontBold)
                    .paddingOnly(top: 24),
                text('T456',
                        //memberProfileData.data.regNo,
                        textColor: Colors.black,
                        fontSize: textSizeMedium,
                        fontFamily: fontRegular)
                    .paddingOnly(top: 8),
                SizedBox(height: 30),
                Container(
                  width: width,
                  decoration: boxDecoration(
                      //    radius: spacing_middle,
                      bgColor: Colors.white,
                      showShadow: false),
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPos = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  //  topLeft: Radius.circular(spacing_middle),
                                  // bottomLeft: Radius.circular(spacing_middle)
                                  ),
                              color: selectedPos == 1
                                  ? Colors.grey
                                  : Color(0x95E9EBF0),
                              border: Border.all(
                                  color: selectedPos == 1
                                      ? Colors.white
                                      : Colors.transparent),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPos = 1;
                                  });
                                },
                                child: FlatButton(
                                  child: text(
                                    'Patient Details',
                                    //gym_lbl_personal_info,
                                    fontSize: textSizeMedium,
                                    fontFamily: fontSemibold,
                                    isCentered: true,
                                    textColor: selectedPos == 1
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey,
                      ).center(),
                      Flexible(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPos = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: width,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(
                                //   topRight: Radius.circular(spacing_middle),
                                //   bottomRight:
                                //    Radius.circular(spacing_middle)
                                // ),
                                color: selectedPos == 2
                                    ? Colors.grey
                                    : Color(0x95E9EBF0),
                                border: Border.all(
                                    color: selectedPos == 2
                                        ? Colors.white
                                        : Colors.transparent),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPos = 2;
                                    });
                                  },
                                  child: FlatButton(
                                    child: text(
                                      'Settings',
                                      // gym_lbl_features,
                                      fontSize: textSizeMedium,
                                      fontFamily: fontSemibold,
                                      isCentered: true,
                                      textColor: selectedPos == 2
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                selectedPos == 1
                    ? Column(
                        children: [
                          Container(
                            decoration: boxDecoration(
                                bgColor: Colors.white,
                                radius: 10,
                                showShadow: true),
                            width: MediaQuery.of(context).size.width - 32,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              children: [
                                infoBox(Icons.call, 'Contact Number 1',
                                    '6376453434'),
                                // infoBox(Icons.call, 'Contact Number 2',
                                //     '2673428632'),
                                infoBox(
                                    Icons.mail, 'Email Id', 'ABC@example.com'),
                              ],
                            ),
                          ).paddingOnly(bottom: 16),
                          Container(
                            decoration: boxDecoration(
                                bgColor: Colors.white,
                                radius: 10,
                                showShadow: true),
                            width: MediaQuery.of(context).size.width - 32,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              children: [
                                infoBox(Icons.date_range, 'Date Of Birth',
                                    '29/01/1995'),
                                infoBox(
                                    Icons.place, 'Address', 'Mohali,Punjab'),
                                // infoBox(Icons.business, 'Occupation', 'Lawyer'),
                                infoBox(
                                    Icons.local_hospital, 'Blood Group', 'B-'),
                                // infoBox(Icons.favorite, 'Marital Status',
                                //     'Unmarried')
                                // infoBox(Icons.fitness_center, 'Favour Name',
                                //     '${memberProfileData.data.memberFavourOf} ${memberProfileData.data.memberFavourName}'),
                              ],
                            ),
                          ).paddingOnly(bottom: 16),
                        ],
                      )
                    : Container(
                        decoration: boxDecoration(
                            bgColor: Colors.white,
                            radius: 10,
                            showShadow: true),
                        width: MediaQuery.of(context).size.width - 32,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          //itemExtent: 4,
                          //itemLength: mList1.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            Container(
                              color: Colors.white,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    switch (mList1[index].id) {
                                      case 1:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FeatureDetailsScreen(
                                                      featureName:
                                                          mList1[index].title,
                                                      mainId: mList1[index].id,
                                                    )));
                                        break;
                                      case 2:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FeatureDetailsScreen(
                                                        featureName:
                                                            mList1[index].title,
                                                        mainId:
                                                            mList1[index].id)));
                                        break;
                                      case 3:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FeatureDetailsScreen(
                                                        featureName:
                                                            mList1[index].title,
                                                        mainId:
                                                            mList1[index].id)));
                                        break;
                                      case 4:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FeatureDetailsScreen(
                                                        featureName:
                                                            mList1[index].title,
                                                        mainId:
                                                            mList1[index].id)));
                                        break;
                                      // case 5:
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               ForgetPassword(
                                      //                   featureName:
                                      //                       'changePassword',
                                      //                   mainId:
                                      //                       mList1[index].id)));
                                      //  break;
                                      case 5:
                                        logout();
                                        break;
                                      default:
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            //placeholder: placeholderWidgetFn(),
                                            imageUrl: mList1[index].img,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                          )
                                              // Image.asset(
                                              //   // placeholder: placeholderWidgetFn(),
                                              //   mList1[index].img,
                                              //   height: 50,
                                              //   width: 50,
                                              //   fit: BoxFit.fill,
                                              // )
                                              .cornerRadiusWithClipRRect(25)
                                              .paddingOnly(right: 16),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              text(mList1[index].title,
                                                  fontFamily: fontMedium,
                                                  textColor: Colors.white),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_right)
                                    ],
                                  ),
                                ),
                              ).paddingAll(8),
                            ),
                          ],
                        )).paddingOnly(bottom: 16),
              ],
            ),
          ).center();
    changeStatusColor(Colors.white);
    return SafeArea(
      key: widget._scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.qr_code),
                onPressed: () {
                  // QrCodeGenerator().launch(context);
                }),
            // IconButton(
            //     icon: Icon(Icons.image),
            //     onPressed: () {
            //       //   MyPhotos().launch(context);
            //     }),
            // IconButton(
            //   icon: Icon(Icons.settings),
            //   color: Colors.white,
            //   onPressed: () {
            //     // Navigator.of(context).pushNamed(GymInfo.routeName);
            //   },
            // ),
          ],
          leading: Container(),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(color: Colors.white, child: imgview),
        ),
      ),
    );
  }
}

Widget infoBox(IconData icon, String title, String subtitle) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Container(
        child: Row(
          children: <Widget>[
            infoIcon(icon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoTitle(title),
                infoSubtitle(subtitle),
              ],
            ),
          ],
        ).paddingAll(8),
      ),
    ),
  );
}

Widget infoIcon(IconData icon) {
  return Icon(icon).paddingAll(20);
}

Widget infoTitle(String title) {
  return text(title, fontFamily: fontMedium, textColor: Colors.black);
}

Widget infoSubtitle(String subtitle) {
  return text(subtitle == '' ? '      __  ' : subtitle, textColor: Colors.grey);
}

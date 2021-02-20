import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main/screens/maps.dart';
import 'package:flutter_app/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/main/models/clinic_info_model.dart';

class ClinicInfo extends StatefulWidget {
  static const String routeName = 'clinic_info';

  @override
  _ClinicInfoState createState() => _ClinicInfoState();
}

class _ClinicInfoState extends State<ClinicInfo> {
  GymInfoModal gymInfoData;
  var isLoading;

  Future<GymInfoModal> getGymInfoData(String token) async {
    const String url =
        'https://regalmojo.in/gymeDiary/api/memberApi/gymInfoData';
    http.Response response = await http.get(Uri.encodeFull(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    GymInfoModal gymInfoListData;

    print('json String');
    print(response.body);
    print('from json String to Map');
    Map result = json.decode(response.body);
    print(result);

    setState(() {
      gymInfoListData = GymInfoModal.fromJson(result);
    });

    return gymInfoListData;
  }

  gymInformationData() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    print('preftoken=========================================');
    // String apiKey = pref.getString('token');
    print('preftoken=========================================Ends');
    getGymInfoData(
            'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDE5ZjlhYWMwMGNhYmVlOTI0MjRmN2QiLCJuZXdEYk5hbWUiOiJkYi0xNjEyMzE1MTk3MTQwIiwiaWF0IjoxNjEyMzI2ODY4fQ.LoGSNrxuardOGUKhiqL-gFSr7F-UrtKHJsSlCM7Tg0w')
        .then((value) {
      setState(() {
        gymInfoData = value;
        isLoading = value.message == null ? '' : value.message;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gymInformationData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: Text(''),
                      expandedHeight: MediaQuery.of(context).size.height * 0.34,
                      floating: false,
                      pinned: true,
                      titleSpacing: 0,
                      backgroundColor: Colors.white,
                      actionsIconTheme: IconThemeData(opacity: 0.0),
                      title: Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Clinic Information',
                                style: boldTextStyle(
                                    size: 20, color: Colors.black))
                          ],
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          color: appStore.scaffoldBackground,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: <Color>[
                                    Colors.grey,
                                    Colors.black
                                  ]),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0)),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.12)),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    'https://gymediary.web.app/assets/media/baseIcon.png'),
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08),
                                        SizedBox(height: 8),
                                        Text('Medical Clinic',
                                            //gymInfoData.data.businessName == null ? '':gymInfoData.data.businessName ,
                                            style: boldTextStyle(size: 20)),
                                        // Text('t3_user_email', style: primaryTextStyle(size: 16)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'Contact Us'),
                            Tab(text: 'Locate Us'),
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    contactUsWidget(context, size, gymInfoData),
                    locationWidget(
                      context, 'SM Heights,Mohali,Punjab',
                      //    '${gymInfoData.data.address}, ${gymInfoData.data.city} ${gymInfoData.data.state}'
                    ),
                  ],
                ),
              ),
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
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: boxDecoration(
            radius: 10,
            bgColor: appStore.isDarkModeOn
                ? appStore.scaffoldBackground
                : Color(0xFFF4F4F4),
            showShadow: true),
        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget contactUsWidget(
    BuildContext context, Size size, GymInfoModal information) {
  _makePhoneCall(String number) async {
    String url = 'tel: +91 $number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _makeMail(String mail) async {
    String url = 'mailto:$mail';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _makeBrowse(String link) async {
    String url = '$link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  return Column(
    children: <Widget>[
      Expanded(
        child: ListView(
          padding: EdgeInsets.only(bottom: 16),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            singleContactCard(
                context: context,
                image: 'assets/images/phone-call.png',
                title: '7887375783',
                // information.data.businessWebsite,
                subTitle: 'Call Us',
                method: _makePhoneCall),
            singleContactCard(
                context: context,
                image: 'assets/images/email.png',
                title: 'ABC@example.com',
                // information.data.businessEmail,
                subTitle: 'Email Us',
                method: _makeMail),
            singleContactCard(
                context: context,
                image: 'assets/images/global.png',
                title: 'Visit Us Online',
                // information.data.businessWebsite,
                subTitle: 'https://www.google.co.in',
                method: _makeBrowse),
            singleContactCard(
                context: context,
                image: 'assets/images/whatsapp.png',
                title: '6348756384',
                // information.data.businessWebsite,
                subTitle: 'Text us on WhatsApp',
                method: _makeBrowse),
            SizedBox(height: size.height * 0.05),
            Container(
              height: 40,
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialIcon(
                      iconPath: 'assets/images/facebook.png',
                      link: 'https://www.facebook.com/',
                      method: _makeBrowse),
                  socialIcon(
                      iconPath: 'assets/images/twitter.png',
                      link: 'https://www.twitter.com',
                      method: _makeBrowse),
                  socialIcon(
                      iconPath: 'assets/images/instagram.png',
                      link: 'https://www.instagram.com',
                      method: _makeBrowse),
                  socialIcon(
                      iconPath: 'assets/images/youtube.png',
                      link: 'https://www.youtube.com',
                      method: _makeBrowse),
                  // socialIcon(
                  //     iconPath: 'assets/images/whatsapp.png',
                  //     link: information.data.businessWebsite,
                  //     method: _makeBrowse),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget socialIcon({String iconPath, String link, Function method}) {
  return InkWell(
    focusColor: Colors.grey,
    autofocus: true,
    onTap: () {
      method(link);
    },
    child: Image.asset(
      iconPath,
      height: 60,
      width: 60,
    ),
  );
}

Widget locationWidget(BuildContext context, String string) {
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(height: 200.0, width: 300.0, child: GMap()),
        Container(
            padding: EdgeInsets.only(top: 10, bottom: 20.0),
            child: text(string)),
        FloatingActionButton.extended(
          backgroundColor: Colors.grey,
          onPressed: () =>
              _makeMap('https://www.google.com/maps/@30.706869,76.685103,20z'),
          label: text('Go to G-map'),
        )
      ],
    ),
  );
}

Widget singleContactCard(
    {BuildContext context,
    String image,
    String title,
    String subTitle,
    Function method,
    String link}) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
    padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
    width: size.width,
    decoration: BoxDecoration(
      color: Color(0x95E9EBF0),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          method(title);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              height: 45,
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('Loading'),
                  image: Image.asset(image, height: 35, width: 10).image,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title == '' ? '--' : title,
                      style: boldTextStyle(size: 16)),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(subTitle, style: secondaryTextStyle(size: 12)),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    ),
  );
}

_makeMap(String link) async {
  String url = '$link';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';

const t12_cat1 = Color(0xFF366cfd);
const t12_cat2 = Color(0xFFff7d34);
const t12_cat3 = Color(0xFF35c88e);
const t12_cat4 = Color(0xFFf32323);
const t12_colors = [t12_cat1, t12_cat2, t12_cat3, t12_cat4];
const t12_gradient_colors = [
  [Color(0xFF7deaa7), Color(0xff57ca8f), Color(0xff189f6b)],
  [Color(0xFF79caff), Color(0xff5b9afb), Color(0xff3155cf)],
  [Color(0xFFFeaa7b), Color(0xfffb965e), Color(0xfff5762f)]
];

// T7Color for Clinic Info

const t7colorPrimary = Color(0xFF2F95A1);
const t7textColorSecondary = Color(0xFF9D9D9D);
const t7view_color = Color(0xFFDADADA);
const t7white = Color(0xFFffffff);

// T5Color for Dashboard,Login,OtpPage,T5Dialog,VisitHistory,T5DataGenerator,T5Widget

const t5ColorPrimary = Color(0XFF5104D7);
const t5TextColorSecondary = Color(0XFF888888);
const t5TextColorThird = Color(0XFFBABFB6);
const t5White = Color(0XFFFFFFFF);
const t5ViewColor = Color(0XFFB4BBC2);
const t5SkyBlue = Color(0XFF1fc9cd);
const t5Cat1 = Color(0XFF45c7db);
const t5Cat2 = Color(0XFF510AD7);
const t5Cat3 = Color(0XFFe43649);
const t5Cat4 = Color(0XFFf4b428);
const t5Cat5 = Color(0XFF22ce9a);
const t5Cat6 = Color(0XFF203afb);

//T1Color for Profile,T1Widget

const t1_colorPrimary = Color(0XFFff8080);
const t1_colorPrimaryDark = Color(0XFFff8080);

const t1_view_color = Color(0XFFDADADA);

const t1_white = Color(0XFFffffff);
const t1_blue = Color(0XFF1D36C0);
const t1_edit_text_background = Color(0XFFE8E8E8);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);

// Light Theme Colors
// AppColors for FlutterAppScreenListing,ThemeList,AppStore,AppTheme,AppWidget
const appColorPrimary = Color(0xFF0A79DF);
const appTextColorPrimary = Color(0xFF212121);
const iconColorPrimary = Color(0xFFFFFFFF);
const appTextColorSecondary = Color(0xFF5A5C5E);
const iconColorSecondary = Color(0xFFA8ABAD);
const appLayout_background = Color(0xFFf8f8f8);
const appDarkRed = Color(0xFFF06263);
const appCat1 = Color(0xFF8998FE);
const appCat2 = Color(0xFFFF9781);
const appCat3 = Color(0xFF73D7D3);
const appShadowColor = Color(0x95E9EBF0);
const appColorPrimaryLight = Color(0xFFF9FAFF);
const appSecondaryBackgroundColor = Color(0xFF131d25);

// Dark Theme Colors
const appBackgroundColorDark = Color(0xFF131d25);
const cardBackgroundBlackDark = Color(0xFF1D2939);
const color_primary_black = Color(0xFF131d25);
const appColorPrimaryDarkLight = Color(0xFFF9FAFF);
const iconColorPrimaryDark = Color(0xFF212121);
const iconColorSecondaryDark = Color(0xFFA8ABAD);
const appShadowColorDark = Color(0x1A3E3942);

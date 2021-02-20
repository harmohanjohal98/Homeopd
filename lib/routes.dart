import 'package:flutter/material.dart';
import 'package:flutter_app/main/models/AppModel.dart';
import 'package:flutter_app/main/screens/FlutterAppScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    FlutterAppScreenListing.tag: (context) =>
        FlutterAppScreenListing(ProTheme()),
  };
}

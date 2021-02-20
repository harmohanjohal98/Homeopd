import 'package:flutter/material.dart';
import 'package:flutter_app/main/profile/features_details/data/feature_data.dart';
import 'package:flutter_app/main/profile/features_details/model/feature_model.dart';


class FeatureDetailsScreen extends StatefulWidget {
  static const String routeName = 'feature_details_screen';

  static int mainID;
  static String featuresName;

  FeatureDetailsScreen({featureName, mainId}) {
    mainID = mainId;
    featuresName = featureName;
  }

  @override
  _FeatureDetailsScreenState createState() => _FeatureDetailsScreenState();
}

class _FeatureDetailsScreenState extends State<FeatureDetailsScreen> {
  List<FeatureModel> membershipDataList;

  @override
  void initState() {
    super.initState();
    membershipDataList = membershipData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            FeatureDetailsScreen.featuresName,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body           : Container());
  }
}

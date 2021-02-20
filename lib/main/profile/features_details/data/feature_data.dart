import 'package:flutter_app/main/profile/features_details/model/feature_model.dart';

List<FeatureModel> membershipData() {
  List<FeatureModel> mListData = List<FeatureModel>();
  mListData.add(
    FeatureModel(
        id: 101,
        packageName: 'STRENGTH 1 MONTHLY',
        packageDuration: '3 Month',
        packagePrice: '800',
        sDate: '08-Oct-2020',
        eDate: '08-Nov-2020',
        status: MembershipStatus.Expired),
  );
  mListData.add(
    FeatureModel(
        id: 101,
        packageName: 'MONTHLY - body building',
        packageDuration: '1 Month',
        packagePrice: '1000',
        sDate: '08-Oct-2020',
        eDate: '08-Nov-2020',
        status: MembershipStatus.Ongoing),
  );
  mListData.add(
    FeatureModel(
        id: 101,
        packageName: 'CARDIO 3 MONTHLY',
        packageDuration: '1 Month',
        packagePrice: '1500',
        sDate: '08-Oct-2020',
        eDate: '08-Nov-2020',
        status: MembershipStatus.Upcomig),
  );
  return mListData;
}

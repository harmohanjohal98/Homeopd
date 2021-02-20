enum MembershipStatus {
  Ongoing,
  Upcomig,
  Expired,
  Freeze,
}

class FeatureModel {
  final int id;
  final String packageName;
  final String packageDuration;
  final String packagePrice;
  final String sDate;
  final String eDate;
  final MembershipStatus status;

  FeatureModel({
    this.id,
    this.packageName,
    this.packageDuration,
    this.packagePrice,
    this.eDate,
    this.sDate,
    this.status,
  });
}

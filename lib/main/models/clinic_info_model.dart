class GymInfoModal {
String message;
Data data;
GymInfoModal({this.message, this.data});
GymInfoModal.fromJson(Map<String, dynamic> json) {
message = json['message'];
data = json['data'] != null ? new Data.fromJson(json['data']) : null;
}
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['message'] = this.message;
  if (this.data != null) {
    data['data'] = this.data.toJson();
  }
  return data;
}
}
class Data {
  String businessWebsite;
  String businessEmail;
  String address;
  String city;
  String state;
  String coordinates;
  String twitterBusiness;
  String facebookBusiness;
  String instagramBusiness;
  String businessName;
  String businessContact;
  Data(
      {this.businessWebsite,
        this.businessEmail,
        this.address,
        this.city,
        this.state,
        this.coordinates,
        this.twitterBusiness,
        this.facebookBusiness,
        this.instagramBusiness,
        this.businessName,
        this.businessContact});
  Data.fromJson(Map<String, dynamic> json) {
    businessWebsite = json['businessWebsite'];
    businessEmail = json['businessEmail'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    coordinates = json['coordinates'];
    twitterBusiness = json['twitterBusiness'];
    facebookBusiness = json['facebookBusiness'];
    instagramBusiness = json['instagramBusiness'];
    businessName = json['businessName'];
    businessContact = json['businessContact'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessWebsite'] = this.businessWebsite;
    data['businessEmail'] = this.businessEmail;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['coordinates'] = this.coordinates;
    data['twitterBusiness'] = this.twitterBusiness;
    data['facebookBusiness'] = this.facebookBusiness;
    data['instagramBusiness'] = this.instagramBusiness;
    data['businessName'] = this.businessName;
    data['businessContact'] = this.businessContact;
    return data;
  }
}
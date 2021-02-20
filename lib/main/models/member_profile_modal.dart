class MemberProfileModal {
  String success;
  String message;
  Data data;

  MemberProfileModal({this.success, this.message, this.data});

  MemberProfileModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int sno;
  String chronicNo;
  String registrationId;
  String cabinId;
  String memName;
  String favourOf;
  String name;
  String contact;
  String altNum;
  String profilePic;
  String dOB;
  int dobNotify;
  String gender;
  String postalAddress;
  String bloodGp;
  String marital;
  String tehsil;
  String dist;
  String discount;
  String relative;
  String dated;
  String datedTime;
  String status;
  String chronicDate;
  String regType;
  String entryType;
  String code;
  String distanceCatg;
  String pLanguage;
  String price;
  String dayPrice;
  String pPass;
  String appNotify;
  int accLabel;
  String emailID;
  int creditAlertLimit;
  String courierAddress;

  Data(
      {this.sno,
        this.chronicNo,
        this.registrationId,
        this.cabinId,
        this.memName,
        this.favourOf,
        this.name,
        this.contact,
        this.altNum,
        this.profilePic,
        this.dOB,
        this.dobNotify,
        this.gender,
        this.postalAddress,
        this.bloodGp,
        this.marital,
        this.tehsil,
        this.dist,
        this.discount,
        this.relative,
        this.dated,
        this.datedTime,
        this.status,
        this.chronicDate,
        this.regType,
        this.entryType,
        this.code,
        this.distanceCatg,
        this.pLanguage,
        this.price,
        this.dayPrice,
        this.pPass,
        this.appNotify,
        this.accLabel,
        this.emailID,
        this.creditAlertLimit,
        this.courierAddress});

  Data.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    chronicNo = json['chronic_no'];
    registrationId = json['registration_id'];
    cabinId = json['cabin_id'];
    memName = json['mem_name'];
    favourOf = json['favour_of'];
    name = json['name'];
    contact = json['contact'];
    altNum = json['alt_num'];
    profilePic = json['profile_pic'];
    dOB = json['d_o_b'];
    dobNotify = json['dob_notify'];
    gender = json['gender'];
    postalAddress = json['postal_address'];
    bloodGp = json['blood_gp'];
    marital = json['marital'];
    tehsil = json['tehsil'];
    dist = json['dist'];
    discount = json['discount'];
    relative = json['relative'];
    dated = json['dated'];
    datedTime = json['dated_time'];
    status = json['status'];
    chronicDate = json['chronic_date'];
    regType = json['regType'];
    entryType = json['entryType'];
    code = json['code'];
    distanceCatg = json['distance_catg'];
    pLanguage = json['p_language'];
    price = json['price'];
    dayPrice = json['day_price'];
    pPass = json['p_pass'];
    appNotify = json['app_notify'];
    accLabel = json['accLabel'];
    emailID = json['emailID'];
    creditAlertLimit = json['creditAlertLimit'];
    courierAddress = json['courierAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['chronic_no'] = this.chronicNo;
    data['registration_id'] = this.registrationId;
    data['cabin_id'] = this.cabinId;
    data['mem_name'] = this.memName;
    data['favour_of'] = this.favourOf;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['alt_num'] = this.altNum;
    data['profile_pic'] = this.profilePic;
    data['d_o_b'] = this.dOB;
    data['dob_notify'] = this.dobNotify;
    data['gender'] = this.gender;
    data['postal_address'] = this.postalAddress;
    data['blood_gp'] = this.bloodGp;
    data['marital'] = this.marital;
    data['tehsil'] = this.tehsil;
    data['dist'] = this.dist;
    data['discount'] = this.discount;
    data['relative'] = this.relative;
    data['dated'] = this.dated;
    data['dated_time'] = this.datedTime;
    data['status'] = this.status;
    data['chronic_date'] = this.chronicDate;
    data['regType'] = this.regType;
    data['entryType'] = this.entryType;
    data['code'] = this.code;
    data['distance_catg'] = this.distanceCatg;
    data['p_language'] = this.pLanguage;
    data['price'] = this.price;
    data['day_price'] = this.dayPrice;
    data['p_pass'] = this.pPass;
    data['app_notify'] = this.appNotify;
    data['accLabel'] = this.accLabel;
    data['emailID'] = this.emailID;
    data['creditAlertLimit'] = this.creditAlertLimit;
    data['courierAddress'] = this.courierAddress;
    return data;
  }
}
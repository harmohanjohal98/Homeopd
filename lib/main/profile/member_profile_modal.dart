class MemberProfileModal {
  String message;
  Data data;

  MemberProfileModal({this.message, this.data});

  MemberProfileModal.fromJson(Map<String, dynamic> json) {
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
  String memberDob;
  String memberAdditionalContact;
  String memberEmail;
  String memberEnquiryResponse;
  String memberAddress;
  String memberPinCode;
  String memberCity;
  String memberState;
  String memberCountry;
  String memberFavourName;
  String memberOccupation;
  String memberQuery;
  String memberBiometricCode;
  String memberReferredBy;
  String memberEntryDate;
  int status;
  String sId;
  String memberNumber;
  String memberName;
  String memberPurpose;
  String memberEnquiryFollowUp;
  String memberFavourOf;
  String memberBloodGp;
  String memberMarital;
  String memberAnniversary;
  String profileImage;
  String memberPassword;
  int memberNo;
  String regNo;
  int iV;

  Data(
      {this.memberDob,
      this.memberAdditionalContact,
      this.memberEmail,
      this.memberEnquiryResponse,
      this.memberAddress,
      this.memberPinCode,
      this.memberCity,
      this.memberState,
      this.memberCountry,
      this.memberFavourName,
      this.memberOccupation,
      this.memberQuery,
      this.memberBiometricCode,
      this.memberReferredBy,
      this.memberEntryDate,
      this.status,
      this.sId,
      this.memberNumber,
      this.memberName,
      this.memberPurpose,
      this.memberEnquiryFollowUp,
      this.memberFavourOf,
      this.memberBloodGp,
      this.memberMarital,
      this.memberAnniversary,
      this.profileImage,
      this.memberPassword,
      this.memberNo,
      this.regNo,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    memberDob = json['memberDob'];
    memberAdditionalContact = json['memberAdditionalContact'];
    memberEmail = json['memberEmail'];
    memberEnquiryResponse = json['memberEnquiryResponse'];
    memberAddress = json['memberAddress'];
    memberPinCode = json['memberPinCode'];
    memberCity = json['memberCity'];
    memberState = json['memberState'];
    memberCountry = json['memberCountry'];
    memberFavourName = json['memberFavourName'];
    memberOccupation = json['memberOccupation'];
    memberQuery = json['memberQuery'];
    memberBiometricCode = json['memberBiometricCode'];
    memberReferredBy = json['memberReferredBy'];
    memberEntryDate = json['memberEntryDate'];
    status = json['status'];
    sId = json['_id'];
    memberNumber = json['memberNumber'];
    memberName = json['memberName'];
    memberPurpose = json['memberPurpose'];
    memberEnquiryFollowUp = json['memberEnquiryFollowUp'];
    memberFavourOf = json['memberFavourOf'];
    memberBloodGp = json['memberBloodGp'];
    memberMarital = json['memberMarital'];
    memberAnniversary = json['memberAnniversary'];
    profileImage = json['profileImage'];
    memberPassword = json['memberPassword'];
    memberNo = json['memberNo'];
    regNo = json['regNo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberDob'] = this.memberDob;
    data['memberAdditionalContact'] = this.memberAdditionalContact;
    data['memberEmail'] = this.memberEmail;
    data['memberEnquiryResponse'] = this.memberEnquiryResponse;
    data['memberAddress'] = this.memberAddress;
    data['memberPinCode'] = this.memberPinCode;
    data['memberCity'] = this.memberCity;
    data['memberState'] = this.memberState;
    data['memberCountry'] = this.memberCountry;
    data['memberFavourName'] = this.memberFavourName;
    data['memberOccupation'] = this.memberOccupation;
    data['memberQuery'] = this.memberQuery;
    data['memberBiometricCode'] = this.memberBiometricCode;
    data['memberReferredBy'] = this.memberReferredBy;
    data['memberEntryDate'] = this.memberEntryDate;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['memberNumber'] = this.memberNumber;
    data['memberName'] = this.memberName;
    data['memberPurpose'] = this.memberPurpose;
    data['memberEnquiryFollowUp'] = this.memberEnquiryFollowUp;
    data['memberFavourOf'] = this.memberFavourOf;
    data['memberBloodGp'] = this.memberBloodGp;
    data['memberMarital'] = this.memberMarital;
    data['memberAnniversary'] = this.memberAnniversary;
    data['profileImage'] = this.profileImage;
    data['memberPassword'] = this.memberPassword;
    data['memberNo'] = this.memberNo;
    data['regNo'] = this.regNo;
    data['__v'] = this.iV;
    return data;
  }
}

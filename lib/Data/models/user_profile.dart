import 'package:sng/Data/models/base.dart';

class UserProfile  extends BaseModel{
  int? status;
  Data? data;

  UserProfile({this.status, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;
  List<String>? roles;
  bool? acceptTerms;
  bool? isProfile;
  String? sId;
  int? noOfTries;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? position;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? emailtoken;

  Data(
      {this.profile,
        this.roles,
        this.acceptTerms,
        this.isProfile,
        this.sId,
        this.noOfTries,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.emailtoken});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    roles = json['roles'].cast<String>();
    acceptTerms = json['acceptTerms'];
    isProfile = json['isProfile'];
    sId = json['_id'];
    noOfTries = json['noOfTries'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    position = json['position'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    emailtoken = json['emailtoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['roles'] = this.roles;
    data['acceptTerms'] = this.acceptTerms;
    data['isProfile'] = this.isProfile;
    data['_id'] = this.sId;
    data['noOfTries'] = this.noOfTries;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['position'] = this.position;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['emailtoken'] = this.emailtoken;
    return data;
  }
}

class Profile {
  String? ni;
  String? address;
  String? dob;
  String? uTR;
  String? nok;
  String? nokRelation;
  String? nokPhone;

  Profile(
      {this.ni,
        this.address,
        this.dob,
        this.uTR,
        this.nok,
        this.nokRelation,
        this.nokPhone});

  Profile.fromJson(Map<String, dynamic> json) {
    ni = json['ni'];
    address = json['address'];
    dob = json['dob'];
    uTR = json['UTR'];
    nok = json['nok'];
    nokRelation = json['nokRelation'];
    nokPhone = json['nokPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ni'] = this.ni;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['UTR'] = this.uTR;
    data['nok'] = this.nok;
    data['nokRelation'] = this.nokRelation;
    data['nokPhone'] = this.nokPhone;
    return data;
  }
}

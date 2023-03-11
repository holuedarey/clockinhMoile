import 'package:sng/Data/models/base.dart';

class UserModel extends BaseModel{
  int? status;
  Data? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  List<Null>? roles;
  int? noOfTries;
  String? sId;
  String? firstname;
  String? lastname;
  String? email;
  String? position;
  String? createdAt;
  String? updatedAt;

  User(
      {this.roles,
        this.noOfTries,
        this.sId,
        this.firstname,
        this.lastname,
        this.email,
        this.position,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    noOfTries = json['noOfTries'];
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    position = json['position'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noOfTries'] = this.noOfTries;
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['position'] = this.position;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}


// class Users{
//
//   final String? id;
//   final String? firstname;
//   final String? lastname;
//   final String? email;
//
//   Users({
//     this.id,
//     this.firstname,
//     this.lastname,
//     this.email,
//   });
//
//   factory Users.fromDocument(doc){
//     return Users(
//         id: doc.data()['id'],
//         email: doc.data()['email'],
//         firstname: doc.data()['firstname'],
//         lastname: doc.data()['lastname'],
//     );
//   }
// }
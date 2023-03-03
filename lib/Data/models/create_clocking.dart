import 'package:clockingapp/Data/models/base.dart';

class AddClocking  extends BaseModel{
  int? status;
  List<Data>? data;

  AddClocking({this.status, this.data});

  AddClocking.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? clockingDateTime;
  String? siteName;
  String? clockingPurpose;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.clockingDateTime,
        this.siteName,
        this.clockingPurpose,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clockingDateTime = json['clocking_date_time'];
    siteName = json['site_name'];
    clockingPurpose = json['clocking_purpose'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['clocking_date_time'] = this.clockingDateTime;
    data['site_name'] = this.siteName;
    data['clocking_purpose'] = this.clockingPurpose;
    data['user_id'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
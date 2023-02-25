import 'base.dart';

class UserProfile extends BaseModel{
  Data? _data;
  String? _message;
  bool? _success;
  String? _timestamp;

  UserProfile({Data? data, String? message, bool? success, String? timestamp}) {
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
    if (success != null) {
      this._success = success;
    }
    if (timestamp != null) {
      this._timestamp = timestamp;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get timestamp => _timestamp;
  set timestamp(String? timestamp) => _timestamp = timestamp;

  UserProfile.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _message = json['message'];
    _success = json['success'];
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['message'] = this._message;
    data['success'] = this._success;
    data['timestamp'] = this._timestamp;
    return data;
  }
}

class Data {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _address;
  String? _createdAt;
  String? _updatedAt;
  User? _user;

  Data(
      {int? id,
        String? firstName,
        String? lastName,
        String? address,
        String? createdAt,
        String? updatedAt,
        User? user}) {
    if (id != null) {
      this._id = id;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (address != null) {
      this._address = address;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (user != null) {
      this._user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  User? get user => _user;
  set user(User? user) => _user = user;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['address'] = this._address;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  String? _url;
  Null? _lastLogin;
  bool? _isSuperuser;
  String? _phone;
  Null? _email;
  bool? _isStaff;
  bool? _isActive;
  bool? _verified;
  String? _userCategory;
  String? _dateJoined;
  String? _updatedAt;
  List<Null>? _groups;
  List<Null>? _userPermissions;

  User(
      {String? url,
        Null? lastLogin,
        bool? isSuperuser,
        String? phone,
        Null? email,
        bool? isStaff,
        bool? isActive,
        bool? verified,
        String? userCategory,
        String? dateJoined,
        String? updatedAt,
        List<Null>? groups,
        List<Null>? userPermissions}) {
    if (url != null) {
      this._url = url;
    }
    if (lastLogin != null) {
      this._lastLogin = lastLogin;
    }
    if (isSuperuser != null) {
      this._isSuperuser = isSuperuser;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (isStaff != null) {
      this._isStaff = isStaff;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (verified != null) {
      this._verified = verified;
    }
    if (userCategory != null) {
      this._userCategory = userCategory;
    }
    if (dateJoined != null) {
      this._dateJoined = dateJoined;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (groups != null) {
      this._groups = groups;
    }
    if (userPermissions != null) {
      this._userPermissions = userPermissions;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  Null? get lastLogin => _lastLogin;
  set lastLogin(Null? lastLogin) => _lastLogin = lastLogin;
  bool? get isSuperuser => _isSuperuser;
  set isSuperuser(bool? isSuperuser) => _isSuperuser = isSuperuser;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  Null? get email => _email;
  set email(Null? email) => _email = email;
  bool? get isStaff => _isStaff;
  set isStaff(bool? isStaff) => _isStaff = isStaff;
  bool? get isActive => _isActive;
  set isActive(bool? isActive) => _isActive = isActive;
  bool? get verified => _verified;
  set verified(bool? verified) => _verified = verified;
  String? get userCategory => _userCategory;
  set userCategory(String? userCategory) => _userCategory = userCategory;
  String? get dateJoined => _dateJoined;
  set dateJoined(String? dateJoined) => _dateJoined = dateJoined;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<Null>? get groups => _groups;
  set groups(List<Null>? groups) => _groups = groups;
  List<Null>? get userPermissions => _userPermissions;
  set userPermissions(List<Null>? userPermissions) =>
      _userPermissions = userPermissions;

  User.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _lastLogin = json['last_login'];
    _isSuperuser = json['is_superuser'];
    _phone = json['phone'];
    _email = json['email'];
    _isStaff = json['is_staff'];
    _isActive = json['is_active'];
    _verified = json['verified'];
    _userCategory = json['user_category'];
    _dateJoined = json['date_joined'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['last_login'] = this._lastLogin;
    data['is_superuser'] = this._isSuperuser;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['is_staff'] = this._isStaff;
    data['is_active'] = this._isActive;
    data['verified'] = this._verified;
    data['user_category'] = this._userCategory;
    data['date_joined'] = this._dateJoined;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

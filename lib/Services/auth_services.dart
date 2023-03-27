import 'dart:async';

import 'package:sng/Views/onboarding/login_page.dart';
import 'package:sng/Views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/http_service.dart';
import '../Data/models/user.dart';
import '../Helper/storage_keys.dart';
import '../Util/endpoint.dart';
import '../Util/storage.dart';

class AuthService {

  static Future<dynamic> login(
      {required String password,  required String email}) async {
    Map<String, String> payload = {
      "email": email,
      "password": password,
    };
    final response = await HttpService.postVerb(APiEndPoint.loginEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> createProfile({required String ni, required String utr, required String address, required String dob, required String nok, required String nokRelation, required String nokPhone, }) async {
    Map<String, dynamic> payload = {
      "ni": ni,
      "address": address,
      "dob":dob,
      "UTR": utr,
      "nok": nok,
      "nokRelation":nokRelation,
      "nokPhone": nokPhone
    };

    final response = await HttpService.patch(APiEndPoint.createProfileEndpoint,payload, true);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> signUp(
      {required String password,  required String email, required String firstname, required String lastname, required String address, required String phoneNumber}) async {
    Map<String, String> payload = {
      "firstname": firstname,
      "lastname": lastname,
      "address":address,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "role": ""
    };
    final response = await HttpService.postVerb(APiEndPoint.registerEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> otp(
      {required String otp, required String phone}) async {
    Map<String, String> payload = {
      "otp": otp,
      "phone": phone,
      "reason": "AccountCreation",
    };
    final response = await HttpService.postVerb(APiEndPoint.otpEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> forgetPassword(
      {required String email}) async {
    Map<String, String> payload = {
      "email": email,
    };
    final response = await HttpService.postVerb(APiEndPoint.forgetPasswordEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }


  static Future<dynamic> changePassword(
      {required String email, required String password, required String token}) async {
    Map<String, String> payload = {
      "email": email,
      "token":token,
      "password":password
    };
    final response = await HttpService.patch(APiEndPoint.forgetPasswordEndpoint, payload, false);
    return HttpService.parseResponse(response);
  }
  static Future logout(context) async {
    await LocalStorageUtils.delete(StorageKeys.userObject);
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static Future profile(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }


}

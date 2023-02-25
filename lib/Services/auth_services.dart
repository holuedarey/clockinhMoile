import 'dart:async';

import 'package:clockingapp/Views/onboarding/login_page.dart';
import 'package:clockingapp/Views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Data/http_service.dart';
import '../Data/models/user.dart';
import '../Util/endpoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final firebaseUser = FirebaseAuth.instance.currentUser;


  static Future<dynamic> loginFirebase(
      {required String phone, required String password}) async {
    UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: phone, password: password);
    User? user = result.user;
    return user;
  }

  static Future<dynamic> signUpFirebase(
      {required String password,  required String email}) async {
    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return user;
  }


  // static Future<dynamic> loginFirebasePhoneNumber(
  //     {required String phoneNumber}) async {
  //   UserCredential result = await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber:phoneNumber);
  //   User? user = result.user;
  //   return user;
  // }

  static Future<dynamic> forgetPasswordFirebase(
      {required String email}) async {
     var result = await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return result;
  }

  static Future<dynamic> saveUserInfoToFireStore({required firstname, required lastname, required address, required phoneNumber}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).get();

    if (!documentSnapshot.exists) {
      //final profileName = await Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
      FirebaseFirestore.instance.collection("users").doc(firebaseUser?.uid).set({
        "uid": firebaseUser?.uid,
        "firstname": firstname,
        "lastname": lastname,
        "displayName": firstname,
        "email": firebaseUser?.email,
        "address": address,
        "phoneNumber": phoneNumber
      }).then((_) => print('Success'));

      documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).get();
    }
    return  Users.fromDocument(documentSnapshot); //currentUser is the instance of Users model class
  }

  static Future<dynamic> login(
      {required String phone, required String password}) async {
    Map<String, String> payload = {
      'email': phone,
      'password': password,
    };
    final response = await HttpService.postVerb(APiEndPoint.loginEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> signUp(
      {required String password,  required String email, required String firstname, required String lastname}) async {
    Map<String, String> payload = {
      "firstname": firstname,
      "lastname": lastname,
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
      {required String phone}) async {
    Map<String, String> payload = {
      "email": phone,
    };
    final response = await HttpService.postVerb(APiEndPoint.forgetPasswordEndpoint,
        body: payload, addAuthToken: false, urlEncodedForm: false);
    return HttpService.parseResponse(response);
  }

  static Future logout(context) async {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginPage()),

    );
  }

  static Future profile(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }


}

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Data/http_service.dart';
import '../Util/endpoint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClockingService {
  static Future<dynamic> createClocking(
      {required String name, required String clockingPurpose}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    Map<String, dynamic> payload = {
      'site_name': name,
      'clocking_purpose': clockingPurpose,
      'user_id': firebaseUser?.uid,
      'clocking_date_time': DateTime.now(),
    };
    FirebaseFirestore.instance
        .collection("attendance")
        .add(payload)
        .then((_) => print('Success'));
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .get();


    var response = await sendEmail(documentSnapshot['firstname'], 'sngcheckin@gmail.com',
        "New Clocking from ${documentSnapshot['firstname']}  ${documentSnapshot['lastname']} at ${DateTime.now()} for $clockingPurpose at $name");


     await sendEmail(documentSnapshot['firstname'], "${firebaseUser?.email}",
        "You $clockingPurpose on ${DateTime.now()} at $name");
  }

  static Future sendEmail(String name, String email, String message) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_ccykj6h';
    const templateId = 'template_spxq5x4';
    const userId = '5LgiIezX5CbGgbNQA';
    const accessToken = '7nxWjLJfKzRNP7O9gc1xQ';

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        //This line makes sure it works for all platforms.
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'accessToken': accessToken,
          'template_params': {
            'from_name': name,
            'from_email': email,
            'message': message
          }
        }));
    return response.body;
  }

  static Future<dynamic> myClocking({required String name}) async {
    Map<String, String> payload = {
      "name": name,
    };
    final response =
        await HttpService.patch(APiEndPoint.subAccountEndpoint, payload);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> viewAllClocking() async {
    final response = await HttpService.getVerb(
      APiEndPoint.subAccountEndpoint,
      addAuthToken: true,
    );
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> viewSingleClocking(id) async {
    final response = await HttpService.getVerb(
        "${APiEndPoint.subAccountEndpoint}$id",
        addAuthToken: true);
    return HttpService.parseResponse(response);
  }
}

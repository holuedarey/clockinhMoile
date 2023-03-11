import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Data/http_service.dart';
import '../Util/endpoint.dart';

class ClockingService {
  static Future<dynamic> createClocking(
      {required String name, required String clockingPurpose}) async {

    Map<String, dynamic> payload = {
      'site_name': name,
      'clocking_purpose': clockingPurpose,
      'clocking_date_time': DateTime.now().toString(),
    };

    final response = await HttpService.postVerb(APiEndPoint.createClockingEndpoint,body: payload,  addAuthToken: true);
    return HttpService.parseResponse(response);
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

  static Future<dynamic> myClocking() async {
    final response =
        await HttpService.getVerb(APiEndPoint.mylockingEndpoint,  addAuthToken: true);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> viewAllClocking() async {
    final response = await HttpService.getVerb(
      APiEndPoint.mylockingEndpoint,
      addAuthToken: true,
    );
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> viewSingleClocking(id) async {
    final response = await HttpService.getVerb(
        "${APiEndPoint.mylockingEndpoint}$id",
        addAuthToken: true);
    return HttpService.parseResponse(response);
  }

  static Future<dynamic> allLocations() async {
    final response = await HttpService.getVerb(APiEndPoint.locationEndpoint, addAuthToken: true);
    return HttpService.parseResponse(response);
  }
}

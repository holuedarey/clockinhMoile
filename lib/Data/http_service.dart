import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import '../Helper/api_exception.dart';
import '../Helper/log_service.dart';
import '../Helper/user_token_manager.dart';
import '../Util/endpoint.dart';

Map<String, String> baseHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

class HttpService {

  static String _url(String route) {
    return route.contains('://')
        ? route
        : '${APiEndPoint.baseUrl}$route';
  }

  static Future<http.Response> getVerb(String route,
      {bool addAuthToken = true}) async {
    final url = _url(route);
    LogService.debug('GET $url');
    try {
      final headers = await _getHeaders(addAuthToken, false);
      final response = await http.get(Uri.parse(url), headers: headers);
      LogService.debug('GET ${response.statusCode} \n ${response.body}');
      return response;
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NoInternetException();
    } on FormatException {
      throw BadFormatException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    }
  }

  static Future<dynamic> postVerb(String route,
      {dynamic body,
        bool addAuthToken = true,
        bool encryptBody = false,
        bool urlEncodedForm = false,
        bool addAtomic = false}) async {
    final url = _url(route);
    LogService.debug('POST $url');
    final headers = await _getHeaders(addAuthToken, urlEncodedForm);
    log(jsonEncode(body));
    log(jsonEncode(headers));


    try {
      final response = await http.post(Uri.parse(url),
          headers: headers,
          body: urlEncodedForm ? body : jsonEncode(body));

      LogService.debug('POST ${response.statusCode} \n ${response.body}');
      return response;
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NoInternetException();
    } on FormatException {
      throw BadFormatException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    }
  }

  static Future<http.Response> put(String route,
      [dynamic body, bool addAuthToken = true]) async {
    final url = _url(route);
    LogService.debug('PUT $url');

    try {
      final headers = await _getHeaders(addAuthToken, false);
      // print("body $body");
      final response = await http.put(Uri.parse(url),
          headers: headers, body: jsonEncode({"data": body}));
      LogService.debug('PUT ${response.body}');
      return response;
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NoInternetException();
    } on FormatException {
      throw BadFormatException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    }
  }

  static Future<http.Response> patch(
      String route, [
        dynamic body,
        bool addAuthToken = true,
        bool encryptBody = false,
      ]) async {
    // print(encryptBody);
    final url = _url(route);
    LogService.debug('PATCH $url');
    try {
      final headers = await _getHeaders(addAuthToken, false);
      final response = await http.patch(Uri.parse(url),
          headers: headers,
          body: jsonEncode(body)
            );
      LogService.debug('PATCH $url ${response.body}');
      log(response.body);
      return response;
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NoInternetException();
    } on FormatException {
      throw BadFormatException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    }
  }

  static Future<dynamic> postMultipartFormData(String route,
      {Map<String, String>? fields,
        File? imgData,
        String? object,
        String? requestType,
        bool addAuthToken = true}) async {
    final url = _url(route);
    LogService.debug('$requestType $url');

    // Open a byteStream
    var stream = http.ByteStream(DelegatingStream.typed(imgData!.openRead()));
    // Get File length
    var length = await imgData.length();

    Uri uri = Uri.parse(url);

    var request = http.MultipartRequest(requestType!, uri);
    if (fields != null) {
      request.fields.addAll(fields);
    }
    request.files.add(
        http.MultipartFile(object!, stream, length, filename: imgData.path));

    final token = await UserTokenManager.getAccessToken();
    LogService.debug("token $token");
    if (token?.isEmpty ?? true) {
      throw UnauthorizedException('Invalid token');
    }
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    request.headers['Content-Type'] = 'application/json';
    var response = await request.send();
    log(response.toString());
    LogService.debug('$requestType ${response.statusCode}');

    return response;
  }

  static Future<Map<String, String>> _getHeaders(bool addAuthToken, bool urlEncodedForm) async {
    var headers = {...baseHeaders};

    if (addAuthToken) {
      final token = await UserTokenManager.getAccessToken();
      LogService.debug("token $token");
      // if (token?.isEmpty ?? true) {
      //   throw UnauthorizedException('Invalid token');
      // }

      headers = {
        ...headers,
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
    }
    if(urlEncodedForm){
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    }
    LogService.debug("headers $headers");

    return headers;
  }

  static dynamic parseResponse(dynamic response) async {
    Map<String, dynamic> responseBody = {};
    print("response code ${response}");
    try {
      responseBody = json.decode(response.body);
      LogService.debug('PARSE RESPONSE $responseBody');
    } catch (ex) {
      LogService.error('HttpService parseResponse: $ex');
      if (ex is FormatException) {
        return Future.error(BadFormatException());
      }
    }
    if (response.statusCode < 200 || response.statusCode >= 400) {
      switch (response.statusCode) {
        case 503:
          return Future.error(NotFoundException("Service unavailable", 0));
        default:
          return Future.error(BadRequestException(
              responseBody['message'] ?? responseBody['error'] ?? responseBody['error']
                  ,
              responseBody["internal_response_code"] ?? 0));
      }
    }
    return responseBody;
  }
}

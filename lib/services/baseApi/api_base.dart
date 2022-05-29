import 'dart:convert';

import 'package:cart_greek/services/baseApi/api_url.dart';
import 'package:http/http.dart' as http;

class ApiBase {
  static Map<String, String> withOutTokenHeaders = {
    'Content-Type': 'application/json',
  };

  static Uri url({required String extendedURL}) {
    return Uri.http(ApiUrl.baseUrl, extendedURL);
  }

  // static Uri url2(
  //     {required String extendedURL, Map<String, dynamic>? queryParam}) {
  //   print('12345');
  //   if (queryParam == null) {
  //     print('abcf');
  //     return Uri.https(ApiUrl.baseUrl, extendedURL);
  //   } else {
  //     print('zzzz');
  //     print(queryParam.toString());
  //     return Uri.https(ApiUrl.baseUrl, extendedURL, queryParam);
  //   }
  // }

  static url1({required String extendedURL}) {
    return Uri.parse("https://" + ApiUrl.baseUrl + extendedURL);
  }

  static Future getRequest({required String extendedURL}) async {
    var client = http.Client();
    // print(requestHeaders);
    return client.get(
      url(extendedURL: extendedURL),
    );
  }
}

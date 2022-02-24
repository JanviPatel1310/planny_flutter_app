import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plany_app/modal/apis/api_exception.dart';
import 'package:plany_app/screens/bottomsections/home.dart';

import 'base_service.dart';

enum APIType { aPost, aGet }

class ApiService extends BaseService {
  var response;

  Future<dynamic> getResponse(
      {@required APIType apiType,
      @required String url,
      Map<String, dynamic> body,
      bool fileUpload = false}) async {
    try {
      String mainUrl = baseURL + url;
      log("URL ---> ${baseURL + url}");
      Map<String, String> header = {
        'Accept': 'application/json',
        'domain': Domain,
        'Authorization': AuthToken,
      };
      print('HEADER  $header');
      if (apiType == APIType.aGet) {
        var result = await http.get(
          Uri.parse(baseURL + url),
          headers: header,
        );
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("response......${response}");
      } else if (fileUpload) {
        dio.FormData formData = new dio.FormData.fromMap(body);

        dio.Response result = await dio.Dio().post(baseURL + url,
            data: formData, options: dio.Options(contentType: "form-data"));
        print('responseType+>${result.data.runtimeType}');
        response = returnResponse(result.statusCode, result.data);
      } else {
        log("REQUEST ENCODE BODY $body");
        var result = await http.post(Uri.parse(mainUrl),
            // headers: header,
            body: body,
            headers: header);
        response = returnResponse(result.statusCode, result.body);

        print('RESPINNN??????????? $response');
      }
      return response;
    } catch (e) {
      log('Error=>.. $e');
    }
  }

  returnResponse(int status, String result) {
    print("status$status");
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 256:
        return jsonDecode(result);

      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}

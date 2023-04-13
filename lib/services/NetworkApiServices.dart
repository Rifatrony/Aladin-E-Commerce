// ignore_for_file: file_names, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aladin_ecommerce/handler/app_exception.dart';
import 'package:aladin_ecommerce/services/BaseApiServices.dart';
import 'package:aladin_ecommerce/view_model/auth/user_preference.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {

  static const int TIME_OUT_DURATION = 20;
   
  @override
  Future getApi(String url) async {
    dynamic responseJson;

    var uri = Uri.parse(url);
    
    try {
      var token = await UserPrefernce().getAccessToken();
      final response =
          await http.get(
            uri,
            headers: {
              'Authorization': 'Bearer $token'
            }
          ).timeout(const Duration(seconds: 20));
          responseJson = returnResponse(response);
    } on SocketException{
      throw FetchDataException("No internet connection", uri.toString());
    }
    on TimeoutException{
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  @override
  Future loginApi(data, String url) async {

    dynamic responseJson;
    var uri = Uri.parse(url);
    
    try{
      var response  = await http.post(
        uri, 
        body: data, 
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      responseJson = returnResponse(response);
    } 
    on SocketException{
      throw FetchDataException("No internet connection", uri.toString());
    }
    on TimeoutException{
      APiNotRespondingException("Api not Responing", uri.toString());
    }
    return responseJson;
  }

  @override
  Future postApi(data, String url) async {

    dynamic responseJson;
    var uri = Uri.parse(url);
    
    try{
      var token = '';
      var response  = await http.post(
        uri, 
        body: data,
        headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      responseJson = returnResponse(response);
    } 
    on SocketException{
      throw FetchDataException("No internet connection", uri.toString());
    }
    on TimeoutException{
      APiNotRespondingException("Api not Responing", uri.toString());
    }
    return responseJson;
  }

  @override
  Future postApiWithRawData(data, String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);
    
    try{
      var response  = await http.post(
        uri, 
        body: json.encode(data), 
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      responseJson = returnResponse(response);
    } 
    on SocketException{
      throw FetchDataException("No internet connection", uri.toString());
    }
    on TimeoutException{
      APiNotRespondingException("Api not Responing", uri.toString());
    }
    return responseJson;
  }
  
  returnResponse(http.Response response) {
    switch (response.statusCode) {

      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
        
      case 400:
        throw BadRequestException(json.decode(response.body), response.request!.url.toString());
      
      case 401:
      case 403:
        throw UnAuthorizedException(json.decode(response.body), response.request!.url.toString());
      
      case 500:
        throw FetchDataException('Error occured with status code : ${response.statusCode}', response.request!.url.toString());
      default:
    }
  }

}


import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:milvik_project/data/base_api.dart';

import '../models/doctor_details.dart';

import 'package:http/http.dart' as http;


import '../response/app_exception.dart';

class NetworkApiService extends BaseApiService {
  final List<Doctor> _doctors = [];

  @override
  Future getDoctorDetailsFromApi() async {

    // dynamic responseJson;
    //List<Doctor> responseJson;
    try {
Uri input = Uri.parse(baseUrl);
debugPrint(baseUrl);
      var response = await http.get(input);
      debugPrint('${response.body}');
      // var docResponse = DoctorsMain.fromJson(json.decode(response.body) as Map<String,dynamic>);
      // responseJson = returnResponse(response);
      List doctorsJson = returnResponse(response) as List;
      for (var doctorDynamic in doctorsJson) {
        Doctor d = Doctor.fromJson(doctorDynamic);
        _doctors.add(d);
      }
      print(_doctors);
      return _doctors;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch(e){
      debugPrint('caught error:: ${e}');
    }
    return _doctors;
  }

  @override
  Future postResponse(String url, Map<String, String> jsonBody) async{
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + url),body: jsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }




  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print(response.body);
        List doctorsJson = jsonDecode(response.body) as List;
        return doctorsJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }





    // Uri doctorDetails = Uri.parse(newURL);
    // var response = await http.get(doctorDetails);
    // print(response.body);
    // List<Doctor> doctors = [];
    //
    // if (response.statusCode == 200) {
    //   List doctorsJson = jsonDecode(response.body) as List;
    //   for (var doctorDynamic in doctorsJson) {
    //     Doctor d = Doctor.fromJson(doctorDynamic);
    //     doctors.add(d);
    //   }
    //   print(doctors);
    // }
    // return doctors;



  }






    // Uri doctorDetails = Uri.parse(newURL);
    // var getDoctorDetails = await http.get(doctorDetails);
    // var toJSon = jsonDecode(getDoctorDetails.body) as List;
    // return toJSon;




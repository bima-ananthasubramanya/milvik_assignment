import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:milvik_project/data/base_api.dart';
import '../models/doctor_details.dart';
import 'package:http/http.dart' as http;
import '../response/app_exception.dart';

class NetworkApiService extends BaseApiService {
  final List<Doctor> _doctors = [];

  @override
  Future<List<Doctor>> getDoctorDetailsFromApi() async {
      Uri input = Uri.parse(apiUrl);
      debugPrint(apiUrl);
      var response = await http.get(input);
      List doctorsJson = returnResponse(response) as List;
      for (var doctorDynamic in doctorsJson) {
        Doctor d = Doctor.fromJson(doctorDynamic);
        _doctors.add(d);
      }
      if (kDebugMode) {
        print(_doctors);
      }
      return _doctors;
    }
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
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }


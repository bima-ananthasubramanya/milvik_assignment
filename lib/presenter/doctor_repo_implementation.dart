import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../database_helper/helper.dart';
import '../models/doctor_details.dart';
import 'doctor_repo.dart';

class DoctorRepoImp implements DoctorRepo {
  BaseApiService apiService = NetworkApiService();

  @override
  Future<List<Doctor>?> getDoctorList() async {
    List<Doctor> doctorList = [];
    bool hasInternet = false;

    hasInternet = await InternetConnectionChecker().hasConnection;
    if (kDebugMode) {
      print("Network Status : $hasInternet");
    }

    if (hasInternet == true) {
      doctorList = await apiService.getDoctorDetailsFromApi();
      print("Inserting data into DB -");

      for (final doctor in doctorList) {
        await DBHelper.saveListOfDoctors(doctor);
      }

      print("Fetching data from DB -");
      List<Doctor> list = await DBHelper.readDoctors();
      print(list);
    } else {
      print("Fetching data from DB -");
      doctorList = await DBHelper.readDoctors();
    }

    return doctorList;
  }
}

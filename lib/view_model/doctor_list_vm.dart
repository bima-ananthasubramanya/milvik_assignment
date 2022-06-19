
import 'package:flutter/material.dart';
import 'package:milvik_project/response/api_response.dart';
import 'package:provider/provider.dart';

import '../models/doctor_details.dart';
import '../repository/doctor_repo_imp.dart';

class DoctorListVM extends ChangeNotifier {
  final myRepo = DoctorRepoImp();

  ApiResponse<List<Doctor>>  doctorMain = ApiResponse.loading();

  void setDoctorMain(ApiResponse<List<Doctor>> response) {
    print("$response");
    doctorMain = response as ApiResponse<List<Doctor>>;
    notifyListeners();
  }

  Future<void> fetchDoctor() async {
    setDoctorMain(ApiResponse.loading());
    myRepo
        .getDoctorList()
        .then((value) => setDoctorMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setDoctorMain(ApiResponse.error(error.toString())));
  }
}
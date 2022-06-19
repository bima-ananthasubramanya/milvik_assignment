

import 'package:milvik_project/data/api_endpoint.dart';
import 'package:milvik_project/data/base_api.dart';
import 'package:milvik_project/data/network_api.dart';
import 'package:milvik_project/models/doctor_details.dart';
import 'package:milvik_project/repository/doctors_repo.dart';

class DoctorRepoImp implements DoctorRepo{
  BaseApiService apiService = NetworkApiService();

  @override
  Future<List<Doctor>?> getDoctorList() async {

    //List<Doctor> doctorsList = [];

    try{
      var response = await apiService.getDoctorDetailsFromApi();
      // final jsonData =  DoctorsMain.fromJson(response);
      return response ;
    }catch(e){
      throw e;
    }

  }
}

// ApiEndPoints().getDoctors
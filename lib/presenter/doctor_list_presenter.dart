
import 'package:flutter/foundation.dart';
import 'package:milvik_project/response/api_response.dart';


import '../data/base_api.dart';
import '../data/network_api.dart';
import '../models/doctor_details.dart';


class DoctorRepo{
  Future<List<Doctor>?> getDoctorList() async {
  }
}

class DoctorRepoImp implements DoctorRepo{
  BaseApiService apiService = NetworkApiService();

  @override
  Future<List<Doctor>?> getDoctorList() async {

    try{
      var response = await apiService.getDoctorDetailsFromApi();
      return response ;
    }catch(e){
      rethrow;
    }
  }
}
class DoctorListPresenter extends ChangeNotifier {
  final myRepo = DoctorRepoImp();

  ApiResponse<List<Doctor>>  doctorMain = ApiResponse.loading();

  void setDoctorMain(ApiResponse<List<Doctor>> response) {
    if (kDebugMode) {
      print("$response");
    }
    doctorMain = response;
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




import '../data/base_api.dart';
import '../data/network_api.dart';
import '../models/doctor_details.dart';
import 'doctors_repo.dart';

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
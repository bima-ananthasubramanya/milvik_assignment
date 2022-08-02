
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


    // Check if network is available
    hasInternet = await InternetConnectionChecker().hasConnection;
    print("Network Status : $hasInternet");

    // If network is available, fetch list of doctors from apiService and update DB
    if (hasInternet == true) {
      doctorList = await apiService.getDoctorDetailsFromApi();
      print("Inserting data into DB -");

      for(final doctor in doctorList) {
        await DBHelper.saveListOfDoctors(doctor);
      }

      print("Fetching data from DB -");
      List<Doctor> list = await DBHelper?.readDoctors();
      print(list);
    }
    // If network is not available, check if data is available in DB
    else {
      print("Fetching data from DB -");
      doctorList = await DBHelper?.readDoctors();
    }

    // If network is not available, and DB is empty, return empty list of Doctors
    return doctorList;
  }

}
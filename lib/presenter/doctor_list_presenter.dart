import 'package:flutter/foundation.dart';
import 'package:milvik_project/response/api_response.dart';
import '../models/doctor_details.dart';
import 'doctor_repo_implementation.dart';

class DoctorListPresenter extends ChangeNotifier {
  final myRepo = DoctorRepoImp();

  ApiResponse<List<Doctor>> doctorMain = ApiResponse.loading();

  void doctorResponse(ApiResponse<List<Doctor>> response) {
    if (kDebugMode) {
      print("$response");
    }
    doctorMain = response;
    notifyListeners();
  }

  Future<void> fetchDoctor() async {
    doctorResponse(ApiResponse.loading());
    myRepo
        .getDoctorList()
        .then((value) => doctorResponse(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            doctorResponse(ApiResponse.error(error.toString())));
  }
}

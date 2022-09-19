import 'package:milvik_project/models/doctor_details.dart';

abstract class BaseApiService {
  final String apiUrl = 'https://5efdb0b9dd373900160b35e2.mockapi.io/contacts';

  Future<List<Doctor>> getDoctorDetailsFromApi();
}

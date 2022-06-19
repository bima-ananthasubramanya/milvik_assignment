
abstract class BaseApiService {
  final String baseUrl = 'https://5efdb0b9dd373900160b35e2.mockapi.io/contacts';

  Future<dynamic> getDoctorDetailsFromApi();
  Future<dynamic> postResponse(String url, Map<String, String> jsonBody);

}


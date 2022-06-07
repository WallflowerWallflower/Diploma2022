import 'package:kaz_med/app/main/user_data.dart';
import 'package:http/http.dart' as http;

class SpecialityService {
  final String baseUrl = 'https://qazmed.eu.ngrok.io/';
  final UserData _userData = UserData();
  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllSpecialities() async {
    return http.get(
      Uri.parse('${baseUrl}med-service/specialty/all'),
      headers: headers,
    );
  }

  Future<http.Response> getSpecialityByID(int specialityID) async {
    String token = await _userData.getToken();
    return http.get(
      Uri.parse('${baseUrl}med-service/specialty/$specialityID'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
  }
}

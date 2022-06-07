import 'package:http/http.dart' as http;
import 'package:kaz_med/app/main/user_data.dart';

class ClinicsService {
  final String baseUrl = 'https://qazmed.eu.ngrok.io/';
  UserData _userData = UserData();

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllMedCenter() async {
    return http.get(
      Uri.parse('${baseUrl}med-service/medCenter/public/all'),
      headers: headers,
    );
  }

  Future<http.Response> searchMedCenterMyName(String name) async {
    return http.get(
      Uri.parse('${baseUrl}med-service/medCenter/public/medCenterName/$name'),
      headers: headers,
    );
  }

  Future<http.Response> filterWithLDRPET(
    String lat,
    String lon,
    String distanceFrom,
    String distanceTo,
    String ratingFrom,
    String ratingTo,
    String priceFrom,
    String priceTo,
    String time,
  ) async {
    return http.get(
      Uri.parse(
          '${baseUrl}med-service/medCenter/public/filter/$lat/$lon/$distanceFrom/$distanceTo/$ratingFrom/$ratingTo/$priceFrom/$priceTo/$time'),
      headers: {
        'Authorization': "Bearer ${_userData.getToken()}",
        'Content-Type': 'application/json'
      },
    );
  }
}

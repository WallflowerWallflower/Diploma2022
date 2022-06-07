import 'package:http/http.dart' as http;
import 'package:kaz_med/app/main/user_data.dart';

class HomeService {
  UserData _userData = UserData();
  final String baseUrl = 'https://qazmed.eu.ngrok.io/';

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllDoctors() {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/all',
      ),
      headers: headers,
    );
  }

  Future<http.Response> getNearDoctors(num lat, num long) {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/all/nearDoctor/$lat/$long',
      ),
      headers: headers,
    );
  }

  // 500 wtf?
  Future<http.Response> filterWithLDRPET(
      String lat,
      String lon,
      String distanceFrom,
      String distanceTo,
      String ratingFrom,
      String ratingTo,
      String priceFrom,
      String priceTo,
      String experienceFrom,
      String experienceTo,
      String time) {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/filter/$lat/$lon/$distanceFrom/$distanceTo/$ratingFrom/$ratingTo/$priceFrom/$priceTo/$experienceFrom/$experienceTo/$time',
      ),
      headers: {
        'Authorization': "Bearer ${_userData.getToken()}",
        'Content-Type': 'application/json'
      },
    );
  }

  Future<http.Response> searchDoctorByName(String name) {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/search/$name',
      ),
      headers: headers,
    );
  }
}

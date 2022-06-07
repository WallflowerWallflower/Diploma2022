import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../main/user_data.dart';

class DoctorService {
  UserData _userData = UserData();
  final String baseUrl = 'https://qazmed.eu.ngrok.io/';

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> createReview(
    String doctorID,
    String userID,
    String rating,
    String reviewText,
  ) async {
    String token = await _userData.getToken();
    return http.post(
      Uri.parse(
        '${baseUrl}review-service/review/doctor/private/create-review/$doctorID/$userID',
      ),
      body: jsonEncode({"reviewRating": rating, "reviewText": reviewText}),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
  }
}

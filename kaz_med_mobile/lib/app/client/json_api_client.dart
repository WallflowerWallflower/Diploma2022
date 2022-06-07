import 'dart:developer';

import 'package:kaz_med/app/main/user_data.dart';
import 'package:kaz_med/core/network/interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'json_api_client_freezed.dart';
part 'json_api_client.freezed.dart';

@freezed
class PlaceholderClient extends BaseClientGenerator with _$PlaceholderClient {
  static final UserData _userData = UserData();
  // Routes
  const PlaceholderClient._() : super();
  const factory PlaceholderClient.login(String name, String password) = _Login;
  const factory PlaceholderClient.getAllDoctors() = _GetAllDoctors;
  const factory PlaceholderClient.getUser(String username) = _GetUser;
  const factory PlaceholderClient.editUser(Map<String, dynamic> data) =
      _EditUser;

  @override
  String get baseURL => 'https://qazmed.eu.ngrok.io/';

  @override
  Future<Map<String, dynamic>> get header async {
    final token = await _userData.getToken();
    log('TOKEN: ' + token);
    return {
      'Content-Type': 'application/json',
      "Authorization":
          "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhc3lsemhhbm5uQGdtYWlsLmNvbSIsImF1dGhvcml0aWVzIjpbIkFETUlOIl0sImlhdCI6MTY1Mjk2MjUzMywiZXhwIjoxNjUyOTY2MTMzfQ.PkRKz7WVl8IpQWY4qBEczSTVqYhkZO-zWkjeNtnvnnPcEMalqrGHQu_hBtfcTYK40rvyY2EHieK5Ti0EzYKsqQ",
      "Authorization": "Bearer " + token,
      // "Authorization":
      //     "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhc3lsemhhbkBnbWFpbC5jb20iLCJhdXRob3JpdGllcyI6WyJBRE1JTiJdLCJpYXQiOjE2NTIzNjEzMDQsImV4cCI6MTY1MjM2NDkwNH0.UPLyIPcFfz7VUU9dziOwLUz7El6Q_vlBC49GZVx_xwVlJGekiTp4CyenXCOydcX_IuN_Y3Kj233ZxupawiPIww",
    };
  }

  @override
  String get path {
    return when<String>(
      login: (String name, String password) => 'auth-service/auth',
      getAllDoctors: () => 'med-service/doctor/public/all',
      getUser: (String username) =>
          'client-service/customer/private/find/$username',
      editUser: (data) =>
          "client-service/customer/private/update/${data['email']}",
      // getAllAnalysis
      //     'auth-service/customer/private/find/$username',
    );
  }

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
      login: (String name, String password) => 'POST',
      editUser: (data) => 'PUT',
    );
  }

  @override
  dynamic get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
      login: (String name, String password) =>
          {"username": name, "password": password},
      editUser: (data) => data,
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () => null,
    );
  }
}

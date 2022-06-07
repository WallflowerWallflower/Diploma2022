import 'package:kaz_med/app/client/json_api_client.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/app/main/user_data.dart';
import 'package:kaz_med/core/freezed/network_error.dart';
import 'package:kaz_med/core/freezed/result.dart';
import 'package:kaz_med/core/network/layers/network_executer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// class ProfileService {
//   Future<Result<ProfileModel, NetworkError>> getProfileInfo(
//       String username) async {
//     return NetworkExecuter.execute(
//         route: PlaceholderClient.getUser(username),
//         responseType: ProfileModel());
//   }
// }

class ProfileService {
  Future<http.Response> getCustomerProfile() async {
    final email = await UserData().getUserEmail();
    return http.get(
      Uri.parse(
          'https://qazmed.eu.ngrok.io/auth-service/customer/private/find/$email'),
      headers: {'Authorization': 'Bearer ${await UserData().getToken()}'},
    );
  }

  Future<http.Response> getDoctorProfile() async {
    final email = await UserData().getUserEmail();
    return http.get(
      Uri.parse(
          'https://qazmed.eu.ngrok.io/auth-service/doctor/private/find/$email'),
      headers: {'Authorization': 'Bearer ${await UserData().getToken()}'},
    );
  }

  Future<Result<dynamic, NetworkError>> updateUser(
      Map<String, dynamic> data) async {
    return NetworkExecuter.execute(route: PlaceholderClient.editUser(data));
  }
}

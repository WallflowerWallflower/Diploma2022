import 'dart:convert';
import 'dart:developer';

import 'package:kaz_med/app/data/models/doctor_model.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/app/data/services/profile_service.dart';
import 'package:kaz_med/app/main/user_data.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/core/freezed/network_error.dart';
import 'package:kaz_med/core/freezed/result.dart';
import 'package:kaz_med/pages/auth/ui/auth_page.dart';
import 'package:kaz_med/pages/profile/ui/about.dart';
import 'package:kaz_med/pages/profile/ui/analysis.dart';
import 'package:kaz_med/pages/profile/ui/appointments.dart';
import 'package:kaz_med/pages/profile/ui/logout.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends BaseBloc {
  ProfileModel? profileModel;
  final ProfileService _profileService = ProfileService();
  // ProfileProvider provider = ProfileProvider();
  Size? size;
  UserData _userData = UserData(); // ProfileProvider? provider;
  bool isAsDoctor = true;
  Data? doctor;
  ProfileModel? customer;

  init(context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isAsDoctor = prefs.getBool('profile')!;
    log('Is as a Doctor: ' + isAsDoctor.toString());
    // await getProfileInfo('asylzhan2');
    // await getProfileInfo();
    await getProfile();
    setLoading(false);
  }

  getProfile() async {
    var response = isAsDoctor
        ? await ProfileService().getCustomerProfile()
        : await ProfileService().getDoctorProfile();
    if (response.statusCode == 200 && isAsDoctor) {
      customer = ProfileModel.fromJson(
        json.decode(utf8.decode(response.bodyBytes)),
      );
      log('Customer: ${customer!.email}');
      notifyListeners();
    } else if (response.statusCode == 200 && !isAsDoctor) {
      doctor = Data.fromJson(
        json.decode(utf8.decode(response.bodyBytes)),
        // json.decode(response.body),
      );
      notifyListeners();
    } else {
      log('Error: ${response.statusCode}');
    }
  }

  // getProfileInfo() async {
  //   Result<ProfileModel, NetworkError> p = await _profileService.getProfileInfo(
  //     await _userData.getUserEmail(),
  //   );
  //   p.when(success: (response) {
  //     log('ROLE: ' + profileModel!.roles!.first.toString());
  //     profileModel = response;
  //     notifyListeners();
  //   }, failure: (error) {
  //     log('Error getProfileInfo');
  //   });
  // }

  toAbout(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AboutPage(
                  profile: profileModel,
                  profileProvider: this,
                )));
  }

  toAppointments(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AppointmentsPage()));
  }

  toAnalysis(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Analysis()));
  }

  // toLogout(context) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => LogoutWidget(
  //                 profileProvider: provider,
  //               )));
  // };yugjighug

  void exit(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const AuthPage()), (route) => false);
  }
}

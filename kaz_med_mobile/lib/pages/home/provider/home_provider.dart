import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:kaz_med/app/data/models/doctor_model.dart';
import 'package:kaz_med/app/data/services/home-service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:location/location.dart';

class HomeProvider extends BaseBloc {
  List<bool> sectionsToggles = List.generate(4, (index) => true);
  TextEditingController searchController = TextEditingController();
  DoctorModel? doctors;
  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  init(BuildContext context) async {
    setLoading(true);
    SizeConfig().init(context);
    await checkIsServiceEnabled();
    await checkIsPermissionGranted();
    await getLocation();
    await getAllDoctors();
    setLoading(false);
    notifyListeners();
  }

  checkIsServiceEnabled() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        return;
      }
    }
  }

  checkIsPermissionGranted() async {
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  getLocation() async {
    locationData = await location.getLocation();
  }

  toggleSections(int index) {
    sectionsToggles[index] = !sectionsToggles[index];
    notifyListeners();
  }

  getAllDoctors() async {
    var response = await HomeService().getAllDoctors();
    if (response.statusCode == 200) {
      log('Success!');
      // doctors.add(
      //   DoctorModel.fromJson(
      //     json.decode(response.body),
      //   ),
      // );
      doctors = DoctorModel.fromJson(
        {'data': json.decode(utf8.decode(response.bodyBytes))},
      );
      notifyListeners();
    } else {
      log('Error: ${response.statusCode}');
    }
  }

  searchDoctorByName() async {
    setIsSendRequest(true);
    var response =
        await HomeService().searchDoctorByName(searchController.text);
    if (response.statusCode == 200) {
      log('Searched Succefully');
      doctors = json.decode(response.body).isNotEmpty
          ? DoctorModel.fromJson(
              {'data': json.decode(response.body)},
            )
          : doctors;
      notifyListeners();
    }
    setIsSendRequest(false);
  }

  searchWithLDRPET(
    String distanceFrom,
    String distanceTo,
    String ratingFrom,
    String ratingTo,
    String priceFrom,
    String priceTo,
    String experienceFrom,
    String experienceTo,
    String time,
  ) async {
    setIsSendRequest(true);
    var response = await HomeService().filterWithLDRPET(
      locationData!.latitude.toString(),
      locationData!.longitude.toString(),
      distanceFrom,
      distanceTo,
      ratingFrom,
      ratingTo,
      priceFrom,
      priceTo,
      experienceFrom,
      experienceTo,
      time,
    );
    log('lat: ${locationData!.latitude}, lon: ${locationData!.longitude}');
    log('Distance: $distanceFrom - $distanceTo');
    log('Rating: $ratingFrom - $ratingTo');
    log('Price: $priceFrom - $priceTo');
    log('Experience: $experienceFrom - $experienceTo');
    log('Time: $time');
    if (response.statusCode == 200) {
      log('Searched with filter Succefully');
      doctors = json.decode(response.body).isNotEmpty
          ? DoctorModel.fromJson(
              {'data': json.decode(response.body)},
            )
          : doctors;
      notifyListeners();
    } else {
      log('Error to load doctors by filter: ${response.statusCode}');
    }
    setIsSendRequest(false);
  }
}

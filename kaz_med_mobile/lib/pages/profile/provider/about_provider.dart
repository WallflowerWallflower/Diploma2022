import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/app/data/services/profile_service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/core/freezed/network_error.dart';
import 'package:kaz_med/core/freezed/result.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/shared/size_config.dart';

class AboutProvider extends BaseBloc {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Size? size;

  final ProfileService _profileService = ProfileService();

  init(context, ProfileModel? profileModel) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    nameController.text = profileModel!.customerName ?? '';
    surnameController.text = profileModel.customerSurname ?? '';
    emailController.text = profileModel.email ?? '';
    notifyListeners();
    setLoading(false);
  }

  updateUser(context, ProfileProvider provider) async {
    var data = {
      "customerId": provider.profileModel!.customerId,
      "customerName": nameController.text,
      "customerSurname": surnameController.text,
      "customerTelNumber": phoneController.text,
      "customerEmail": emailController.text,
      "doctors": [],
      "address": addressController.text,
      "password": provider.profileModel!.password
    };
    Result<dynamic, NetworkError> r = await _profileService.updateUser(data);
    r.when(success: (response) {
      Navigator.of(context).pop(provider.init(context));
    }, failure: (error) {
      log('Error during chnage name (About Provider)');
    });
  }
}

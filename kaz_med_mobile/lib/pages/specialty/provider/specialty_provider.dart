import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaz_med/app/data/models/speciality_model.dart';
import 'package:kaz_med/app/data/services/speciality_service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/auth/ui/login_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';

class SpecialtyProvider extends BaseBloc {
  TextEditingController searchController = TextEditingController();
  SpecialityModel? specialityModel;

  SpecialityService _service = SpecialityService();

  init(BuildContext context) async {
    setLoading(true);
    SizeConfig().init(context);
    await getAllSpecialities(context);
  }

  getAllSpecialities(BuildContext context) async {
    var response = await _service.getAllSpecialities();
    if (response.statusCode == 200) {
      log('Success to load specialities');

      specialityModel = SpecialityModel.fromJson(
        {'data': json.decode(utf8.decode(response.bodyBytes))},
      );

      setLoading(false);
    } else if (response.statusCode == 401) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: DefaultText(
            text: 'Unauhtorized',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          content: DefaultText(text: 'To continue you need to log in'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ),
                (route) => false,
              ),
              child: DefaultText(text: 'Ok', color: AppColors.primaryColor),
            ),
          ],
        ),
      );
    }
    notifyListeners();
  }

  List<String> specialties = [
    'Specialty 1',
    'Specialty 2',
    'Specialty 3',
    'Specialty 4',
    'Specialty 5',
    'Specialty 6',
    'Specialty 7',
    'Specialty 8',
    'Specialty 9',
    'Specialty 10',
  ];
}

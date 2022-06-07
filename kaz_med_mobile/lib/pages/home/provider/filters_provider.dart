import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../app/data/services/home-service.dart';

class FiltersProvider extends BaseBloc {
  SfRangeValues distanceValues = const SfRangeValues(200.0, 7000.0);
  SfRangeValues ratingValues = const SfRangeValues(1.0, 5.0);
  SfRangeValues priceValues = const SfRangeValues(2000.0, 20000.0);
  SfRangeValues experienceValues = const SfRangeValues(1.0, 10.0);
  TextEditingController controller = TextEditingController();
  HomeProvider? model;

  init(BuildContext context, HomeProvider _model) {
    setLoading(true);
    SizeConfig().init(context);
    model = _model;
    controller.text = '12:30';
    setLoading(false);
  }

  setDistanceValues(dynamic newValues) {
    distanceValues = newValues;
    notifyListeners();
  }

  setRatingValues(SfRangeValues newValues) {
    ratingValues = newValues;
    notifyListeners();
  }

  setPriceValues(SfRangeValues newValues) {
    priceValues = newValues;
    notifyListeners();
  }

  setExperienceValues(SfRangeValues newValues) {
    experienceValues = newValues;
    notifyListeners();
  }

  searchWithLDRPET(BuildContext context) async {
    Navigator.of(context).pop(
      await model!.searchWithLDRPET(
        distanceValues.start.toInt().toString(),
        distanceValues.end.toInt().toString(),
        ratingValues.start.toInt().toString(),
        ratingValues.end.toInt().toString(),
        priceValues.start.toInt().toString(),
        priceValues.end.toInt().toString(),
        experienceValues.start.toInt().toString(),
        experienceValues.end.toInt().toString(),
        controller.text,
      ),
    );
  }
}

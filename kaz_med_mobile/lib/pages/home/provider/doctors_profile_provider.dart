import 'package:flutter/cupertino.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/shared/size_config.dart';

import '../../../app/data/services/home-service.dart';

class DoctorsProfileProvider extends BaseBloc {
  bool feesTapped = false;
  bool reviewsTapped = false;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  setFeesTap() {
    feesTapped = !feesTapped;
    notifyListeners();
  }

  setReviewsTap() {
    reviewsTapped = !reviewsTapped;
    notifyListeners();
  }

}

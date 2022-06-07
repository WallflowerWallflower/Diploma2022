import 'package:flutter/cupertino.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';

class DoctorAnalysisEditProvider extends BaseBloc {
  TextEditingController analysisController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  save(BuildContext context) {
    Navigator.pop(context);
  }
}

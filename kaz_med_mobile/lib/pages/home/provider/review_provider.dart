import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/app/data/services/doctor_service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';

import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';
import '../../auth/ui/login_page.dart';
import '../ui/widgets/success_message.dart';

class ReviewProvider extends BaseBloc {
  DoctorService _doctorService = DoctorService();

  TextEditingController controller = TextEditingController();
  int starCount = -1;
  int? doctorID;

  init(BuildContext context, int id) {
    setLoading(true);
    SizeConfig().init(context);
    doctorID = id;
    setLoading(false);
  }

  setStarCount(int index) {
    starCount = index;
    log(starCount.toString());
    notifyListeners();
  }

  sendReview(BuildContext context) async {
    var response = await _doctorService.createReview(
      doctorID.toString(),
      '1',
      (starCount + 1).toString(),
      controller.text,
    );
    if (response.statusCode == 200) {
      log('Successfully sent review');
      showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => const AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          content: SuccessMessage(),
        ),
      );
      // Navigator.of(context).pop();
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
    } else {
      log('Error to send review: ${response.statusCode}');
      Navigator.pop(context);
    }
  }
}

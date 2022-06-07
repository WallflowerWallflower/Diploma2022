import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/pages/profile/ui/customer_profile.dart';
import 'package:kaz_med/pages/profile/ui/doctor_profile.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProfileProvider>(
      model: ProfileProvider(),
      onReady: (_) async => await _.init(context),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : model.isAsDoctor
                ? CustomerProfile(model: model)
                : DoctorProfile(model: model);
      },
    );
  }
}

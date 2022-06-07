import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_page.dart';
import 'package:kaz_med/pages/contact/ui/contact_with_doctor.dart';
import 'package:kaz_med/pages/home/ui/home_page.dart';
import 'package:kaz_med/pages/index/provider/index_provider.dart';
import 'package:kaz_med/pages/profile/ui/profile.dart';
import 'package:kaz_med/pages/specialty/ui/specialty_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      onReady: (p0) => p0.init(context),
      model: IndexProvider(),
      builder: (context, model, child) {
        return Scaffold(
          body: _body[model.bottomIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            selectedFontSize: getProportionateScreenHeight(16),
            unselectedFontSize: getProportionateScreenWidth(14),
            unselectedItemColor: AppColors.systemBlackColor,
            showUnselectedLabels: true,
            currentIndex: model.bottomIndex,
            items: model.items!,
            onTap: (index) => model.setBottomIndex(index, context),
          ),
        );
      },
    );
  }
}

var _body = [
  HomePage(),
  ClinicsPage(),
  const SpecialtyPage(),
  // const ContactWithDoctor(),
  const Profile(),
];

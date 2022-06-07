import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/provider/clinics_provider.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_container.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_filter_page.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_profile_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class ClinicsPage extends StatelessWidget {
  ClinicsPage({Key? key}) : super(key: key);

  List<String> svgs = [
    AppSvgImages.cardiologist,
    AppSvgImages.dentist,
    AppSvgImages.optician,
    AppSvgImages.orthopedic,
  ];

  List<String> sections = [
    'Cardiologist',
    'Dentist',
    'Optician',
    'Optician',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ClinicsProvider>(
      model: ClinicsProvider(),
      onReady: (_) => _.init(context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              getProportionateScreenHeight(120),
            ),
            child: AppBar(
              title: DefaultText(
                text: 'clinics'.tr(),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              centerTitle: true,
              backgroundColor: AppColors.defaultBackgroundColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  getProportionateScreenHeight(70),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  child: ListTile(
                    title: TextFormField(
                      controller: model.searchController,
                      cursorColor: AppColors.systemBlackColor,
                      onFieldSubmitted: (value) async =>
                          await model.searchByName(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: AppColors.systemBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(14),
                        ),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: getProportionateScreenWidth(10),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyColor,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: "clinicsName".tr(),
                        hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenHeight(14),
                          ),
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.search,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClinicsFilters(),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(6),
                          vertical: getProportionateScreenHeight(6),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          AppSvgImages.filter,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: model.isLoading
              ? const LoadingView()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'topClinics',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: DefaultText(
                              text: 'viewAll'.tr(),
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: model.isSendRequest
                            ? const LoadingView()
                            : ListView.separated(
                                padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(17),
                                  bottom: getProportionateScreenHeight(17),
                                ),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 1,
                                separatorBuilder: (_, index) => SizedBox(
                                  height: getProportionateScreenHeight(28),
                                ),
                                itemBuilder: (_, index) => GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ClinicsProfilePage(
                                        image: model.clinics[index],
                                        clinicsProvider: model,
                                      ),
                                    ),
                                  ),
                                  child: ClinicsContainer(
                                    image: model.clinics[index],
                                    clinicsProvider: model,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

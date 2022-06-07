import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/pages/home/ui/doctors_profile_page.dart';
import 'package:kaz_med/pages/home/ui/filters_page.dart';
import 'package:kaz_med/pages/home/ui/widgets/doctors_container.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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

  List<String> doctors = [
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
    AppPngImages.doctor_1,
    AppPngImages.doctor_2,
    AppPngImages.doctor_3,
    AppPngImages.doctor_4,
  ];

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
      onReady: (p0) => p0.init(context),
      model: HomeProvider(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                getProportionateScreenHeight(120),
              ),
              child: AppBar(
                title: DefaultText(
                  text: 'doctors'.tr(),
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
                            await model.searchDoctorByName(),
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
                          hintText: "doctorsName".tr(),
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenHeight(14),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              await model.searchDoctorByName();
                            },
                            child: const Icon(
                              CupertinoIcons.search,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FiltersPage(
                              homeProvider: model,
                            ),
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
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            svgs.length,
                            (index) => GestureDetector(
                              onTap: () => model.toggleSections(index),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: getProportionateScreenWidth(60),
                                    height: getProportionateScreenHeight(60),
                                    decoration: BoxDecoration(
                                      color: model.sectionsToggles[index]
                                          ? AppColors.primaryColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      svgs[index],
                                      color: model.sectionsToggles[index]
                                          ? AppColors.whiteColor
                                          : AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  DefaultText(
                                    text: sections[index],
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DefaultText(
                              text: 'topDoctors'.tr(),
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
                                  itemCount: model.doctors!.data!.length,
                                  separatorBuilder: (_, index) => SizedBox(
                                    height: getProportionateScreenHeight(28),
                                  ),
                                  itemBuilder: (_, index) => GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DoctorsProfilePage(
                                          image: doctors[index],
                                          homeProvider: model,
                                          index: index,
                                        ),
                                      ),
                                    ),
                                    child: DoctorsContainer(
                                      image: doctors[index],
                                      model: model,
                                      index: index,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

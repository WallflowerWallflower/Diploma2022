import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/specialty/provider/specialty_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class SpecialtyPage extends StatelessWidget {
  const SpecialtyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<SpecialtyProvider>(
      onReady: (p0) => p0.init(context),
      model: SpecialtyProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              getProportionateScreenHeight(120),
            ),
            child: AppBar(
              title: DefaultText(
                text: 'specialties'.tr(),
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
                        hintText: 'speciality'.tr(),
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
                  ),
                ),
              ),
            ),
          ),
          body: model.isLoading
              ? const LoadingView()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'listOfSpecialties'.tr(),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        isCenter: false,
                      ),
                      UIHelper.verticalSpace(15),
                      _buildPointers(model),
                    ],
                  ),
                ),
        );
      },
    );
  }

  _buildPointers(SpecialtyProvider model) {
    return Column(
      children: List.generate(
        model.specialityModel!.data!.length,
        (index) => Row(
          children: [
            Container(
              width: getProportionateScreenWidth(5),
              height: getProportionateScreenHeight(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.systemBlackColor,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                // provider.toAnalysisDetail(context);
              },
              child: DefaultText(
                text: model.specialityModel!.data![index].specialtyName!,
                isCenter: false,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

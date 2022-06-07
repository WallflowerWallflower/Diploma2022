import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/provider/clinics_profile_provider.dart';
import 'package:kaz_med/pages/clinics/provider/clinics_provider.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_container.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class ClinicsProfilePage extends StatelessWidget {
  final String image;
  final ClinicsProvider clinicsProvider;
  const ClinicsProfilePage(
      {Key? key, required this.image, required this.clinicsProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ClinicsProfileProvider>(
      model: ClinicsProfileProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(70),
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.systemBlackColor,
                      ),
                    ),
                    title: DefaultText(
                      text: 'clinicsProfile'.tr(),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    centerTitle: true,
                    backgroundColor: AppColors.defaultBackgroundColor,
                    elevation: 0,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: AppColors.systemBlackColor,
                        ),
                      )
                    ],
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClinicsContainer(
                          image: image,
                          clinicsProvider: clinicsProvider,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(17),
                        ),
                        DefaultText(
                          text: 'about'.tr(),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        DefaultText(
                          text:
                              'Akhmetova Aygerim was born and raised in Kazakhstan, and completed her medical degree at the Kazakh National Medical University  . She is fully trained in all aspects of cardiology and a founding member of Blitz & Hertz.',
                          isCenter: false,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                        _divider(),
                        DefaultText(
                          text: 'qualification'.tr(),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        _buildPointers(model.admissionFee),
                        _divider(),
                        DefaultText(
                          text: 'services'.tr(),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        _buildPointers(model.services),
                        _divider(),
                        _buildOtherTiles('doctors'.tr()),
                        _divider(),
                        _buildOtherTiles('reviews'.tr()),
                        SizedBox(
                          height: getProportionateScreenHeight(96),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(13),
      ),
      child: const Divider(
        color: AppColors.greyColor,
      ),
    );
  }

  _buildPointers(List<String> list) {
    return Column(
      children: List.generate(
        list.length,
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
              child: DefaultText(
                text: list[index],
                isCenter: false,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildOtherTiles(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(
          text: text,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.systemBlackColor,
        ),
      ],
    );
  }
}

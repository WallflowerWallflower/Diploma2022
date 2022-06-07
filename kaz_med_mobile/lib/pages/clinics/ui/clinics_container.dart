import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/pages/clinics/provider/clinics_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';

class ClinicsContainer extends StatelessWidget {
  final String image;
  final ClinicsProvider clinicsProvider;
  const ClinicsContainer(
      {Key? key, required this.image, required this.clinicsProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(7),
        vertical: getProportionateScreenHeight(7),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 4),
            color: AppColors.shadowColor,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(image),
          // SvgPicture.asset(model.clinics[index]),
          SizedBox(
            width: getProportionateScreenWidth(16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  isCenter: false,
                  text: clinicsProvider.medCenters!.medCenterName!,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(9),
                ),
                DefaultText(
                  isCenter: false,
                  text: clinicsProvider.medCenters!.medCenterAddress!,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(4),
                        vertical: getProportionateScreenHeight(4),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primaryColor.withOpacity(0.26),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: AppColors.primaryColor,
                            size: 12,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          DefaultText(
                            text:
                                clinicsProvider.medCenters!.rating!.toString(),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location,
                            color: AppColors.greyColor,
                            size: 12,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: DefaultText(
                                    isCenter: false,
                                    text: clinicsProvider
                                                .medCenters!.distance !=
                                            null
                                        ? clinicsProvider.medCenters!.distance!
                                            .toString()
                                        : 'empty',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 1,
          ),
        ],
      ),
    );
  }
}

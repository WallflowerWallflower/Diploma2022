import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/widgets/loading_view.dart';

import '../../../../shared/size_config.dart';
import '../../../../shared/theme.dart';
import '../../../../widgets/default_text.dart';

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer(
      {Key? key, required this.image, required this.model, required this.index})
      : super(key: key);
  final HomeProvider model;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return model.isLoading
        ? LoadingView()
        : Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        isCenter: false,
                        text:
                            "${model.doctors!.data![index].doctorName ?? 'Name'}  ${model.doctors!.data![index].doctorSurname ?? 'Surname'}",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(9),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: DefaultText(
                              isCenter: false,
                              text: model.doctors!.data![index].specialties!
                                          .length ==
                                      0
                                  ? 'Default speciality'
                                  : model.doctors!.data![index].specialties!
                                      .first.specialtyName!,
                              isOverFlow: true,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location,
                            color: AppColors.greyColor,
                            size: 12,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          DefaultText(
                            text: model.doctors!.data![index].distance != null
                                ? model.doctors!.data![index].distance!
                                    .toString()
                                : 'empty',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(4),
                      ),
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
                              text: model.doctors!.data![index].rating!
                                  .toString(),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/pages/home/ui/doctors_profile_page.dart';
import 'package:kaz_med/pages/home/ui/home_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(253),
      height: getProportionateScreenHeight(270),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(15),
            ),
            child: SvgPicture.asset(
              AppSvgImages.successMessage,
              width: getProportionateScreenWidth(125),
              height: getProportionateScreenHeight(125),
            ),
          ),
          const Spacer(),
          DefaultText(
            text: 'Success!',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          DefaultText(
            text: 'Thanks for review!',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.greyColor,
          ),
          const Spacer(
            flex: 6,
          ),
          GestureDetector(
            onTap: () async {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              width: getProportionateScreenWidth(117),
              height: getProportionateScreenHeight(48),
              child: DefaultText(
                text: 'Ok',
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';

class LogoutWidget extends StatelessWidget {
  final ProfileProvider profileProvider;

  LogoutWidget({required this.profileProvider});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(30),
              horizontal: getProportionateScreenWidth(30)),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(45)),
              DefaultText(
                text: 'areYouWantLogout'.tr(),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              SizedBox(height: getProportionateScreenHeight(45)),
              const Divider(
                thickness: 1,
                height: 0,
              ),
              SizedBox(
                width: profileProvider.size!.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: profileProvider.size!.width * 0.4,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 0.3,
                              color: AppColors.systemLightGrayColor),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: DefaultText(
                            text: 'no'.tr(),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: 0.3,
                              color: AppColors.systemLightGrayColor),
                        ),
                      ),
                      width: profileProvider.size!.width * 0.4,
                      child: TextButton(
                        onPressed: () {
                          profileProvider.exit(context);
                        },
                        child: DefaultText(
                          text: 'yes'.tr(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.systemRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ],
    );
  }
}

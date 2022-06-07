import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/analysis_detail_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class AnalysisDetail extends StatelessWidget {
  const AnalysisDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AnalysisDetailProvider>(
      model: AnalysisDetailProvider(),
      onReady: (_) => _.init(context),
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
                      text: 'analysis'.tr(),
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
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(text: 'analysis'.tr()),
                      UIHelper.verticalSpace(15),
                      Container(
                        width: getProportionateScreenWidth(375),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.greyColor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(25),
                            vertical: getProportionateScreenHeight(8),
                          ),
                          child: DefaultText(
                            text: 'Blood test',
                            fontWeight: FontWeight.w500,
                            isCenter: false,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(15),
                      DefaultText(text: 'description'.tr()),
                      UIHelper.verticalSpace(15),
                      Container(
                        width: getProportionateScreenWidth(375),
                        height: getProportionateScreenHeight(200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.greyColor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(25),
                            vertical: getProportionateScreenHeight(8),
                          ),
                          child: DefaultText(
                            text: 'You have best blood ever bro!',
                            fontWeight: FontWeight.w500,
                            isCenter: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottomSheet: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(25),
                  ),
                  child: Expanded(
                    child: DefaultButton(
                      text: 'back'.tr(),
                      textColor: AppColors.whiteColor,
                      press: () => Navigator.pop(context),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/language_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LanguageProvider>(
      model: LanguageProvider(),
      onReady: (_) => _.init(context),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(30)),
                width: model.size!.width,
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'changeLanguage'.tr(),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: model.langs.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: AppColors.systemDarkGrayColor,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            model.changeLangByIndex(context, index);
                          },
                          title: Text(
                            model.langs[index],
                          ),
                          trailing: Radio<String>(
                              value: model.langs[index],
                              groupValue: model.langGroupValue,
                              onChanged: (value) {
                                model.changeLangByIndex(context, index);
                              }),
                        );
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    DefaultButton(
                      text: "apply".toUpperCase().tr(),
                      color: AppColors.primaryColor,
                      press: () async {
                        await model.applyChoosedLang(context);
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

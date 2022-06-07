import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/payment/provider/payment_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<PaymentProvider>(
      model: PaymentProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
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
                      text: 'payment'.tr(),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    centerTitle: true,
                    backgroundColor: AppColors.defaultBackgroundColor,
                    elevation: 0,
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
                      DefaultText(
                        text: 'payForYourAppointment'.tr(),
                        isCenter: false,
                      ),
                      UIHelper.verticalSpace(20),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(7),
                          vertical: getProportionateScreenHeight(10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 4),
                              color: AppColors.shadowColor,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                model.toCreditCard(context);
                              },
                              leading: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(13),
                                  vertical: getProportionateScreenHeight(13),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: SvgPicture.asset(
                                  AppSvgImages.debit_card_ic,
                                  width: getProportionateScreenWidth(25),
                                  height: getProportionateScreenHeight(22),
                                ),
                              ),
                              title: DefaultText(
                                text: 'Credit/Debit card',
                                fontWeight: FontWeight.w600,
                                isCenter: false,
                              ),
                              subtitle: DefaultText(
                                text: 'Pay with Visa or Mastercard',
                                fontWeight: FontWeight.w400,
                                isCenter: false,
                                color: AppColors.greyColor,
                                fontSize: 12,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            _divider(),
                            ListTile(
                              leading: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(13),
                                  vertical: getProportionateScreenHeight(13),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: SvgPicture.asset(
                                  AppSvgImages.bank_ic,
                                  width: getProportionateScreenWidth(29),
                                  height: getProportionateScreenHeight(26),
                                ),
                              ),
                              title: DefaultText(
                                text: 'Bank transfer',
                                fontWeight: FontWeight.w600,
                                isCenter: false,
                              ),
                              subtitle: DefaultText(
                                text: 'Transfer money from your bank',
                                fontWeight: FontWeight.w400,
                                isCenter: false,
                                color: AppColors.greyColor,
                                fontSize: 12,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            _divider(),
                            ListTile(
                              leading: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(13),
                                  vertical: getProportionateScreenHeight(13),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: SvgPicture.asset(
                                  AppSvgImages.debit_card_ic,
                                  width: getProportionateScreenWidth(25),
                                  height: getProportionateScreenHeight(22),
                                ),
                              ),
                              title: DefaultText(
                                text: 'Other payments methods',
                                fontWeight: FontWeight.w600,
                                isCenter: false,
                              ),
                              subtitle: DefaultText(
                                text: 'View other payment options',
                                fontWeight: FontWeight.w400,
                                isCenter: false,
                                color: AppColors.greyColor,
                                fontSize: 12,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: const Divider(
        color: AppColors.greyColor,
      ),
    );
  }
}

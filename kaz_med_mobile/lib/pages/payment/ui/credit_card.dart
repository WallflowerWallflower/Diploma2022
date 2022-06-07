import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/payment/provider/credit_card_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../shared/theme.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<CreditCardProvider>(
      model: CreditCardProvider(),
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
                      text: 'creditCard'.tr(),
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
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'addCardDetails'.tr(),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      UIHelper.verticalSpace(20),
                      DefaultText(
                        text: 'cardName'.tr(),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      UIHelper.verticalSpace(8),
                      TextFormField(
                        controller: model.nameController,
                        cursorColor: AppColors.systemBlackColor,
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: AppColors.systemBlackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionateScreenHeight(14),
                          ),
                        ),
                        decoration: InputDecoration(
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
                        ),
                      ),
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(20),
                      ),
                      DefaultText(text: 'cardNumber'.tr()),
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(8),
                      ),
                      TextFormField(
                        controller: model.numberController,
                        cursorColor: AppColors.systemBlackColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: '#### #### #### ####',
                              filter: {"#": RegExp(r'[0-9]')}),
                          //   // CardFormatter()
                          //   // FilteringTextInputFormatter.deny(
                          //   //   RegExp(r'[ ]'),
                          //   // ),
                          //   // LengthLimitingTextInputFormatter(16)
                        ],
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: AppColors.systemBlackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionateScreenHeight(14),
                          ),
                        ),
                        decoration: InputDecoration(
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
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/auth/providers/signup_provider.dart';
import 'package:kaz_med/pages/auth/ui/login_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/loading_view.dart';

import '../../../widgets/default_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<SignUpProvider>(
      onReady: (p0) => p0.init(context),
      model: SignUpProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(22),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(12),
                              vertical: getProportionateScreenHeight(12),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.primaryColor.withOpacity(0.26),
                            ),
                            child: SvgPicture.asset(AppSvgImages.person),
                          ),
                          title: DefaultText(
                            text: 'signUp'.tr(),
                            isCenter: false,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          subtitle: DefaultText(
                            text: 'createYourAccount'.tr(),
                            color: AppColors.greyColor,
                            isCenter: false,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: model.firstNameController,
                                  cursorColor: AppColors.systemBlackColor,
                                  decoration: InputDecoration(
                                    label: DefaultText(
                                      text: 'firstName'.tr(),
                                      color: AppColors.greyColor,
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
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: model.lastNameController,
                                  cursorColor: AppColors.systemBlackColor,
                                  decoration: InputDecoration(
                                    label: DefaultText(
                                      text: 'lastName'.tr(),
                                      color: AppColors.greyColor,
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: model.emailController,
                          cursorColor: AppColors.systemBlackColor,
                          decoration: InputDecoration(
                            label: DefaultText(
                              text: 'email'.tr(),
                              color: AppColors.greyColor,
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
                          ),
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: model.passwordController,
                          cursorColor: AppColors.systemBlackColor,
                          obscureText: model.isPasswordVisible,
                          decoration: InputDecoration(
                            label: DefaultText(
                              text: 'password'.tr(),
                              color: AppColors.greyColor,
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
                            suffixIcon: GestureDetector(
                              onTap: () => model.setPasswordVisibility(),
                              child: Icon(
                                !model.isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Wrap(
                          children: [
                            DefaultText(
                              text: 'byContinuingYouAgreeToOur'.tr(),
                              fontSize: 12,
                              color: AppColors.greyColor,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: DefaultText(
                                text: 'termsOfService'.tr(),
                                fontSize: 12,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            DefaultText(
                              text: 'and',
                              fontSize: 12,
                              color: AppColors.greyColor,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: DefaultText(
                                text: 'andPrivacyPolicy'.tr(),
                                fontSize: 12,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        DefaultButton(
                          text: 'createYourAccount'.tr(),
                          press: () => model.register(context),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultText(
                              text: 'alreadyHaveAccount'.tr(),
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor,
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                  (route) => false),
                              child: DefaultText(
                                text: 'login'.tr(),
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

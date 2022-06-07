import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/auth/providers/login_provider.dart';
import 'package:kaz_med/pages/auth/ui/signup_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LoginProvider>(
      onReady: (p0) => p0.init(context),
      model: LoginProvider(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: model.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(22),
                ),
                child: model.isLoading
                    ? const LoadingView()
                    : Column(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(12),
                                vertical: getProportionateScreenHeight(12),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.26),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SvgPicture.asset(
                                AppSvgImages.lock,
                              ),
                            ),
                            title: DefaultText(
                              text: 'welcomeBack'.tr(),
                              isCenter: false,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            subtitle: DefaultText(
                              text: 'enterCredentialsToContinue'.tr(),
                              color: AppColors.greyColor,
                              isCenter: false,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(55),
                          ),
                          TextFormField(
                            controller: model.emailController,
                            cursorColor: AppColors.systemBlackColor,
                            keyboardType: TextInputType.emailAddress,
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
                          SizedBox(
                            height: getProportionateScreenHeight(55),
                          ),
                          TextFormField(
                            controller: model.passwordController,
                            cursorColor: AppColors.systemBlackColor,
                            obscureText: true,
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
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(60),
                          ),
                          DefaultButton(
                            text: 'login'.tr(),
                            press: () => model.verificate(context),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(26),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: DefaultText(
                              text: 'forgotPassword'.tr(),
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultText(
                                text: 'noAccount'.tr(),
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor,
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpPage(),
                                  ),
                                ),
                                child: DefaultText(
                                  text: 'signUp'.tr(),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () => model.setAsDoctor(),
                            child: DefaultText(
                              text: "Login as a ${model.isAsDoctor ? 'doctor' : 'customer'}",
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

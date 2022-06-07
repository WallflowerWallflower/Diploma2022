import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/about_provider.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class AboutPage extends StatelessWidget {
  final ProfileModel? profile;
  final ProfileProvider? profileProvider;
  const AboutPage(
      {Key? key, required this.profile, required this.profileProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AboutProvider>(
      model: AboutProvider(),
      onReady: (_) => _.init(context, profile!),
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
                      text: 'aboutMe'.tr(),
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
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
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
                              // SvgPicture.asset(AppSvgImages.avatar),
                              Image.asset(AppPngImages.avatar),
                              UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(15)),
                              DefaultText(
                                text: 'Kenes Aidana',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(20),
                        _buildController(model.nameController, 'name'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        _buildController(
                            model.surnameController, 'surname'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        _buildController(model.emailController, 'email'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        _buildController(
                            model.birthController, 'dayOfBirthday'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        _buildController(
                            model.phoneController, 'phoneNumber'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        _buildController(
                            model.addressController, 'placeOfLiving'.tr()),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(20),
                        ),
                        DefaultButton(
                          press: () {
                            // Navigator.pop(context);
                            model.updateUser(context, profileProvider!);
                          },
                          text: 'save'.tr(),
                          color: AppColors.primaryColor,
                        ),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _buildController(
    TextEditingController controller,
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultText(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Flexible(
          child: TextField(
            controller: controller,
            cursorColor: AppColors.systemBlackColor,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: AppColors.defaultBackgroundColor,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}

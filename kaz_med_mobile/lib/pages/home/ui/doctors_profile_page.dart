import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/booking/ui/booking_page.dart';
import 'package:kaz_med/pages/home/provider/doctors_profile_provider.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/pages/home/ui/review_page.dart';
import 'package:kaz_med/pages/home/ui/widgets/doctors_container.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';

class DoctorsProfilePage extends StatelessWidget {
  DoctorsProfilePage(
      {Key? key,
      required this.image,
      required this.homeProvider,
      required this.index})
      : super(key: key);
  final String image;
  final HomeProvider homeProvider;
  final int index;

  List<String> qualifiactions = [
    'Bachelor of Medicine, Bachelor of Surgery (MBBS), 1989',
    'Fellows of the Royal Australasian of Surgeons, 1999',
    'Advanced Diploma in Business Management, 2010',
  ];

  List<String> services = [
    'Surgery for coronary heart disease',
    'Combined cardiac procedures',
    'Diagnosis and treatment of heart conditions',
  ];

  List<String> fees = [
    'reception - consultation of a neurologist - 10 000 tg',
    'appointment - consultation with an  - 6000 tg endoscopist',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseProvider<DoctorsProfileProvider>(
      onReady: (p0) => p0.init(context),
      model: DoctorsProfileProvider(),
      builder: (context, model, child) {
        return Scaffold(
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
                text: 'doctorsProfile'.tr(),
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
          bottomSheet: _bottomSheet(context),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorsContainer(
                    image: image,
                    model: homeProvider,
                    index: index,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(17),
                  ),
                  DefaultText(
                    text: 'about'.tr(),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  DefaultText(
                    text: homeProvider.doctors!.data![index].about != null
                        ? homeProvider.doctors!.data![index].about.toString()
                        : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                    isCenter: false,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                  _divider(),
                  DefaultText(
                    text: 'qualification'.tr(),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  _buildPointers(
                      homeProvider.doctors!.data![index].qualifications != null
                          ? [homeProvider.doctors!.data![index].qualifications!]
                          : qualifiactions),
                  _divider(),
                  DefaultText(
                    text: 'services'.tr(),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  _buildPointers(services),
                  _divider(),
                  GestureDetector(
                    onTap: () => model.setReviewsTap(),
                    child:
                        _buildOtherTiles('reviews'.tr(), model.reviewsTapped),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(
                        model.reviewsTapped ? 10 : 0),
                  ),
                  model.reviewsTapped
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppSvgImages.star),
                                SizedBox(
                                  width: getProportionateScreenWidth(5),
                                ),
                                DefaultText(
                                  text: '4.7',
                                  fontSize: 10,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                DefaultText(
                                  text: 'Aigul Alabaeva',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            DefaultText(
                              isCenter: false,
                              text:
                                  'I want to say thank you to the Department of Traumatology! Thanks to all doctors and nurses for professional service',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  _divider(),
                  GestureDetector(
                    onTap: () => model.setFeesTap(),
                    child: _buildOtherTiles('fees'.tr(), model.feesTapped),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  model.feesTapped
                      ? _buildPointers(
                          homeProvider.doctors!.data![index].fees != null
                              ? [
                                  homeProvider.doctors!.data![index].fees!
                                      .toString()
                                ]
                              : fees)
                      : const SizedBox(),
                  SizedBox(
                    height: getProportionateScreenHeight(96),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _bottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReviewPage(
                      doctorID: homeProvider.doctors!.data![index].doctorId!,
                    ),
                  ),
                ),
                child: Container(
                  color: AppColors.defaultBackgroundColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(14),
                      vertical: getProportionateScreenHeight(14),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(AppSvgImages.message),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
              ),
              Expanded(
                child: DefaultButton(
                  text: 'bookAppointment'.tr(),
                  textColor: AppColors.whiteColor,
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BookingPage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(26),
          ),
        ],
      ),
    );
  }

  _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(13),
      ),
      child: const Divider(
        color: AppColors.greyColor,
      ),
    );
  }

  _buildPointers(List<String> list) {
    return Column(
      children: List.generate(
        list.length,
        (index) => Row(
          children: [
            Container(
              width: getProportionateScreenWidth(5),
              height: getProportionateScreenHeight(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.systemBlackColor,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Expanded(
              child: DefaultText(
                text: list[index],
                isCenter: false,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildOtherTiles(String text, bool tapped) {
    return Container(
      color: AppColors.whiteColor.withOpacity(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          Icon(
            tapped ? CupertinoIcons.chevron_down : Icons.arrow_forward_ios,
            color: AppColors.systemBlackColor,
          ),
        ],
      ),
    );
  }
}

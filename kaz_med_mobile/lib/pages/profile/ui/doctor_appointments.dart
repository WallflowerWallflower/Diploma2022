import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/doctor_appointments_provider.dart';
import 'package:kaz_med/pages/profile/ui/doctor_edit_appointment.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';

import '../../../widgets/default_text.dart';

class DoctorAppointments extends StatelessWidget {
  DoctorAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<DoctorAppointmentsProvider>(
      model: DoctorAppointmentsProvider(),
      onReady: (p0) => p0.init(context),
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
                text: 'My appointments',
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
                  text: 'My appointments',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  isCenter: false,
                ),
                UIHelper.verticalSpace(15),
                _buildPointers(context, _appointments),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildPointers(BuildContext context, List<String> list) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
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
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoctorEditAppointment(),
                    ),
                  ),
                  child: DefaultText(
                    text: list[index],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _appointments = [
    'Aidana,  10.02.2022, 19:30, address: c. Almaty, st. Nazarbaev 102',
    'Aidana  17.02.2022, 12:00, address: c. Almaty, st. Seitova 20',
    'Aidana,  20.02.2022, 11:30, address: c. Almaty, st. Nazarbaev 120',
  ];
}

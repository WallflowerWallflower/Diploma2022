import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';

class DoctorEditAppointment extends StatefulWidget {
  const DoctorEditAppointment({Key? key}) : super(key: key);

  @override
  State<DoctorEditAppointment> createState() => _DoctorEditAppointmentState();
}

class _DoctorEditAppointmentState extends State<DoctorEditAppointment> {
  final TextEditingController commentController = TextEditingController();
  String status = 'Wating to arrived';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              text: 'Appointment',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
            backgroundColor: AppColors.defaultBackgroundColor,
            elevation: 0,
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(20),
          ),
          child: DefaultButton(
            text: 'Save',
            press: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSections('Customer name', 'Aidana'),
              _buildSections('Date', '10.02.2022, 19:30'),
              _buildSections('Address', 'c. Almaty, st. Nazarbaev 102'),
              DefaultText(
                text: 'Status',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(15),
                  right: getProportionateScreenWidth(10),
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: status,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                    size: 35,
                  ),
                  elevation: 0,
                  underline: SizedBox(),
                  borderRadius: BorderRadius.circular(8),
                  onChanged: (String? newValue) {
                    setState(() {
                      status = newValue!;
                    });
                  },
                  items: <String>[
                    'Wating to arrived',
                    'Patient did not arrive',
                    'Appointment accepted'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              _buildSections(
                'The name of the attending doctor',
                'Akhmetova A.A.',
              ),
              _buildSections('Medical center', '№24 city ​​Hospital'),
              DefaultText(
                text: 'Comment',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              TextField(
                controller: commentController,
                maxLines: 10,
                cursorColor: AppColors.systemBlackColor,
                decoration: InputDecoration(
                  fillColor: AppColors.whiteColor,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildSections(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: DefaultText(
            text: text,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}

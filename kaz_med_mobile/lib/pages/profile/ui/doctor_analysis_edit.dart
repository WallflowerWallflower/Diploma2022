import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/doctor_analysis_edit_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';

class DoctorAnalysisEdit extends StatelessWidget {
  const DoctorAnalysisEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<DoctorAnalysisEditProvider>(
      model: DoctorAnalysisEditProvider(),
      onReady: (p0) => p0.init(context),
      builder: (context, model, child) {
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
                  text: 'Analysis',
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
                press: () => model.save(context),
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
                    text: 'Analysis',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    isCenter: false,
                  ),
                  UIHelper.verticalSpace(15),
                  _buildTextController(model.analysisController),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  DefaultText(
                    text: 'Description',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    isCenter: false,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  _buildTextController(model.descriptionController,
                      isDescription: true),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TextField _buildTextController(TextEditingController controller,
      {bool isDescription = false}) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.systemBlackColor,
      maxLines: isDescription ? 10 : 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
      ),
    );
  }
}

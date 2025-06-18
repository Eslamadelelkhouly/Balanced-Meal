import 'dart:developer';

import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/widgets/custom_drop_down.dart';
import 'package:balancedmeal/core/widgets/custom_text_field.dart';
import 'package:balancedmeal/core/widgets/custpm_button.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late SingleValueDropDownController controllerdropdown1;
  late TextEditingController wightController, heightController, ageController;
  String gender = '';
  bool isFormCompleted = false;
  double cal = 0;

  @override
  void initState() {
    super.initState();
    controllerdropdown1 = SingleValueDropDownController();
    wightController = TextEditingController();
    heightController = TextEditingController();
    ageController = TextEditingController();

    wightController.addListener(checkFormCompleted);
    heightController.addListener(checkFormCompleted);
    ageController.addListener(checkFormCompleted);
  }

  void checkFormCompleted() {
    setState(() {
      isFormCompleted = gender.isNotEmpty &&
          wightController.text.isNotEmpty &&
          heightController.text.isNotEmpty &&
          ageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    controllerdropdown1.dispose();
    wightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomDropDown(
              width: MediaQuery.of(context).size.width * 0.8,
              hinttext: 'Choose your gender',
              dropdowntext1: 'Male',
              dropdowntext2: 'Female',
              text: 'Gender',
              onChanged: (value) {
                gender = value!;
                checkFormCompleted();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomTextField(
              text: 'Weight',
              hinttext: 'Enter your weight',
              onSaved: (value) {},
              controller: wightController,
              state: true,
              suffix: 'Kg',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomTextField(
              text: 'Height',
              hinttext: 'Enter your height',
              onSaved: (value) {},
              controller: heightController,
              state: true,
              suffix: 'Cm',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomTextField(
              text: 'Age',
              hinttext: 'Enter your age',
              onSaved: (value) {},
              controller: ageController,
              state: false,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            CustomButton(
              statebutton: isFormCompleted,
              onPressed: isFormCompleted
                  ? () {
                      log(gender);
                      log(wightController.text);
                      log(heightController.text);
                      log(ageController.text);
                      if (gender == 'Female') {
                        cal = (655.1 +
                            (9.56 * double.parse(wightController.text)) +
                            (1.85 * double.parse(heightController.text)) -
                            (4.67 * double.parse(ageController.text)));
                        log(cal.toString());
                      } if(gender == 'Male') {
                        cal = (666.47 +
                            (13.75 * double.parse(wightController.text)) +
                            (5 * double.parse(heightController.text)) -
                            (6.75 * double.parse(ageController.text)));
                        log(cal.toString());
                      }
                      else {
                        log(cal.toString());
                      }
                    }
                  : null,
              text: 'Next',
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              textColor: Colors.white,
              backgrounColor: AppColor.orange,
            ),
          ],
        ),
      ),
    );
  }
}

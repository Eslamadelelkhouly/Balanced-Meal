import 'package:balancedmeal/core/widgets/custom_drop_down.dart';
import 'package:balancedmeal/core/widgets/custom_text_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late SingleValueDropDownController controllerdropdown1;
  late TextEditingController wight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerdropdown1 = SingleValueDropDownController();
    wight = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerdropdown1.dispose();
    wight.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          CustomDropDown(
            width: MediaQuery.of(context).size.width * 0.8,
            hinttext: 'Choose your gender',
            dropdowntext1: 'Male',
            dropdowntext2: 'Female',
            text: 'Gender',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            text: 'Weight',
            iconField: '',
            hinttext: 'Enter your weight',
            onSaved: (value) {},
            controller: wight,
            state: true,
            suffix: 'kg',
          ),
        ],
      ),
    );
  }
}

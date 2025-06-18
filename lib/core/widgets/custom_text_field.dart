import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.hinttext,
    required this.onSaved,
    required this.controller,
    required this.state,
    this.suffix,
  });
  final String text;
  final String hinttext;
  final String? Function(String?)? onSaved;
  final TextEditingController controller;
  final bool state;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.textStylesemibold50014poppins,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 52,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your $text';
              }
            },
            cursorColor: Colors.black,
            onSaved: onSaved,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: AppStyle.textStylesemibold50016Questrial.copyWith(
                color: Color(0xff959595),
              ),
              suffix: state
                  ? Text(
                      '$suffix',
                      style: AppStyle.textStylesemibold50014poppins.copyWith(
                        color: Colors.black,
                      ),
                    )
                  : SizedBox(),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEAECF0)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffEAECF0)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffEAECF0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

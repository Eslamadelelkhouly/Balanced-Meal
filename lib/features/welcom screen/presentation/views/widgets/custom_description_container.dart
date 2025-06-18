import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomDiscriptionContainer extends StatelessWidget {
  const CustomDiscriptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      child: Text(
        textAlign: TextAlign.center,
        'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
        style: AppStyle.textStyleregular20poppins.copyWith(
          color: AppColor.whitedarker,
        ),
      ),
    );
  }
}

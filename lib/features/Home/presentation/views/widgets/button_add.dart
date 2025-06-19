import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 32,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Add',
          style: AppStyle.textStylesemibold50016poppins.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

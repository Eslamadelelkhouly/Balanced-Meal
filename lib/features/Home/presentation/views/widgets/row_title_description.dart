import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class RowTitlAndDescription extends StatelessWidget {
  const RowTitlAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Bell Pepper',
          style: AppStyle.textStylesemibold50016poppins,
        ),
        Spacer(),
        Text(
          '12 Cal',
          style: AppStyle.textStylesemibold50014poppins.copyWith(
            color: Color(0xff959595),
          ),
        ),
      ],
    );
  }
}

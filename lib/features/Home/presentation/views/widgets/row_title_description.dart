import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class RowTitlAndDescription extends StatelessWidget {
  const RowTitlAndDescription({
    super.key,
    required this.title,
    required this.cal,
  });
  final String title, cal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyle.textStylesemibold50016poppins,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$cal cal',
          style: AppStyle.textStylesemibold50014poppins.copyWith(
            color: const Color(0xff959595),
          ),
        ),
      ],
    );
  }
}

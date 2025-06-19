import 'package:balancedmeal/core/utils/Images.dart';
import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/button_add.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_title_description.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3D898989),
              blurRadius: 15.5,
              offset: Offset(3, 4),
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            width: 163,
            height: 108,
            child: Image.asset(
              Images.testItem,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RowTitlAndDescription(),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '\$12',
                style: AppStyle.textStylesemibold50016poppins,
              ),
              Spacer(),
              ButtonAdd(),
            ],
          ),
        ],
      ),
    );
  }
}

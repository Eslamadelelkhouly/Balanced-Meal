import 'dart:developer';
import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/core/widgets/custpm_button.dart';
import 'package:flutter/material.dart';

class ContainerInfoBottom extends StatelessWidget {
  const ContainerInfoBottom({
    super.key,
    required this.cal,
    required this.sumsallary,
    required this.sumcal,
  });

  final String cal;
  final String sumsallary;
  final String sumcal;

  @override
  Widget build(BuildContext context) {
    // احسب النسبة مرة واحدة
    final double percentage = calculatePercentage(cal: cal, sumcal: sumcal);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x30DEDEDE),
            blurRadius: 15.5,
            offset: const Offset(0, -9),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Cal',
                  style: AppStyle.textStylesemibold50016poppins,
                ),
                const Spacer(),
                Text(
                  '$sumcal Cal out of $cal Cal',
                  style: AppStyle.textStylesemibold50014poppins.copyWith(
                    color: const Color(0xff959595),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Price',
                  style: AppStyle.textStylesemibold50016poppins,
                ),
                const Spacer(),
                Text(
                  '\$ $sumsallary',
                  style: AppStyle.textStylesemibold50016poppins.copyWith(
                    color: AppColor.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Order',
              onPressed: () {},
              width: MediaQuery.of(context).size.width * 0.8,
              height: 52,
              textColor: Colors.white,
              backgrounColor: AppColor.orange,
              statebutton: percentage > 0.1,
            ),
          ],
        ),
      ),
    );
  }

  double calculatePercentage({required String cal, required String sumcal}) {
    final double calValue = double.tryParse(cal) ?? 1;
    final double sumCalValue = double.tryParse(sumcal) ?? 0;
    return sumCalValue / calValue;
  }
}

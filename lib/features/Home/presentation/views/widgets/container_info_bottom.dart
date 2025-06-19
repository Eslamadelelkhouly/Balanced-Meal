import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/core/widgets/custpm_button.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_of_container_circule.dart';
import 'package:flutter/material.dart';

class ContainerInfoBottom extends StatelessWidget {
  const ContainerInfoBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
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
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Cal',
                  style: AppStyle.textStylesemibold50016poppins,
                ),
                const Spacer(),
                Text(
                  '1000 Cal out of 1200 Cal',
                  style: AppStyle.textStylesemibold50014poppins.copyWith(
                    color: const Color(0xff959595),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Price',
                  style: AppStyle.textStylesemibold50016poppins,
                ),
                const Spacer(),
                Text(
                  '\$ 125',
                  style: AppStyle.textStylesemibold50016poppins.copyWith(
                    color: AppColor.orange,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RowOfContainerCircule(),
            CustomButton(
              text: 'Order',
              width: MediaQuery.of(context).size.width * 0.8,
              height: 52,
              textColor: Colors.white,
              backgrounColor: AppColor.orange,
              statebutton: true,
            ),
          ],
        ),
      ),
    );
  }
}

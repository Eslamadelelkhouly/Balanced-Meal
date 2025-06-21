import 'dart:developer';
import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/router_screen.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/core/widgets/custpm_button.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/home_view.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/manager/cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ContainerInfoBottom extends StatelessWidget {
  const ContainerInfoBottom({
    super.key,
    required this.cal,
    required this.sumsallary,
    required this.sumcal,
    required this.selectProduct,
    required this.titlebutton,
    required this.onpress,
  });

  final String cal;
  final String sumsallary;
  final String sumcal;
  final String titlebutton;
  final List<ProductItem> selectProduct;
  final bool onpress;

  void _showSuccessDialog(
    BuildContext context,
    List<ProductItem> selectProduct,
    String cal,
    String sumsallary,
    String sumcal,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: new CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: calculatePercentage(cal: cal, sumcal: sumcal),
            center: new Text(
              "${(calculatePercentage(cal: cal, sumcal: sumcal) * 100).toStringAsFixed(1)}%",
              style: AppStyle.textStylesemibold50016poppins,
            ),
            progressColor: AppColor.orange,
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(
                  RouterScreen.orderSummary,
                  extra: {
                    'selectProduct': selectProduct,
                    'cal': cal,
                    'sumsallary': sumsallary,
                    'sumcal': sumcal,
                  },
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              text: titlebutton,
              onPressed: () {
                if (onpress) {
                  _showSuccessDialog(
                    context,
                    selectProduct,
                    cal,
                    sumsallary,
                    sumcal,
                  );
                } else {
                  context.read<AddProductCubit>().addProduct(
                        selectProduct: selectProduct,
                      );
                }
              },
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

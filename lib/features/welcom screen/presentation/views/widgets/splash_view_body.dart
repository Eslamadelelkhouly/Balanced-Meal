import 'package:balancedmeal/core/utils/Images.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/widgets/custom_description_container.dart';
import 'package:flutter/material.dart';

class WelcomViewBody extends StatelessWidget {
  const WelcomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.backgrounimagewelcomview),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Text(
            'Balanced Meal',
            style: AppStyle.textStyle48bold.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          CustomDiscriptionContainer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          
        ],
      ),
    );
  }
}


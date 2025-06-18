import 'package:balancedmeal/core/utils/Images.dart';
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
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          
        ],
      ),
    ); 
  }
}
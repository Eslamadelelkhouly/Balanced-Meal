import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ContainerCircle extends StatelessWidget {
  const ContainerCircle({super.key, required this.icon});
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.orange,
      ),
      child: Center(
        child: Icon(
          icon.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

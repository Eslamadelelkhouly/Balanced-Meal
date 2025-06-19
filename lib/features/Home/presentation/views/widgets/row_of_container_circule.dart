import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/container_circle.dart';
import 'package:flutter/material.dart';

class RowOfContainerCircule extends StatelessWidget {
  const RowOfContainerCircule({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 25,
      child: Row(
        children: [
          ContainerCircle(
            icon: const Icon(
              Icons.remove,
              size: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '1',
            style: AppStyle.textStylesemibold50016poppins,
          ),
          const SizedBox(width: 10),
          ContainerCircle(
            icon: const Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

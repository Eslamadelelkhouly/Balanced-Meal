import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/container_circle.dart';
import 'package:flutter/material.dart';

class RowOfContainerCircule extends StatelessWidget {
  final int number;
  final void Function(int) onQuantityChanged;

  const RowOfContainerCircule({
    super.key,
    required this.number,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 25,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (number > 0) onQuantityChanged(number - 1);
            },
            child: ContainerCircle(
              icon: const Icon(
                Icons.remove,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$number',
            style: AppStyle.textStylesemibold50016poppins,
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              onQuantityChanged(number + 1);
            },
            child: ContainerCircle(
              icon: const Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

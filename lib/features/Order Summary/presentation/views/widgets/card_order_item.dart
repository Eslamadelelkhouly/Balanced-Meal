import 'package:balancedmeal/core/utils/Images.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_of_container_circule.dart';
import 'package:flutter/material.dart';

class CardOrderItem extends StatelessWidget {
  const CardOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 78,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3D898989),
            blurRadius: 15.50,
            offset: Offset(3, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 78,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(Images.testItem),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      'Bell Pepper',
                      style: AppStyle.textStylesemibold50016poppins,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                    ),
                    Text(
                      '\$12',
                      style: AppStyle.textStylesemibold50016poppins,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    '12 cal',
                    style: AppStyle.textStylesemibold50016poppins,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  RowOfContainerCircule(
                    number: 1,
                    onQuantityChanged: (qda) {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

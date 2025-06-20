import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/button_add.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_of_container_circule.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_title_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.cal,
    required this.salary,
    required this.urlimg,
    required this.onTotalSalaryChanged,
  });

  final String title, cal, salary, urlimg;
  final void Function(int salary, int calories, int quantity) onTotalSalaryChanged;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  int quantity = 0;

  int get totalSalary => quantity * (int.tryParse(widget.salary) ?? 0);
  int get totalCalories => quantity * (int.tryParse(widget.cal) ?? 0);

  void _updateQuantity(int newQty) {
    setState(() {
      quantity = newQty;
    });
    widget.onTotalSalaryChanged(totalSalary, totalCalories, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x3D898989),
            blurRadius: 15.5,
            offset: const Offset(3, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 163,
            height: 108,
            child: CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: const CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: widget.urlimg,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          RowTitlAndDescription(
            title: widget.title,
            cal: widget.cal,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$${widget.salary}',
                style: AppStyle.textStylesemibold50016poppins,
              ),
              const Spacer(),
              quantity == 0
                  ? ButtonAdd(
                      onTap: () => _updateQuantity(1),
                    )
                  : RowOfContainerCircule(
                      number: quantity,
                      onQuantityChanged: (newQty) => _updateQuantity(newQty),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

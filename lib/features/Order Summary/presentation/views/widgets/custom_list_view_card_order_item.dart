import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/card_order_item.dart';
import 'package:flutter/material.dart';

class CustomListViewCardOrderItem extends StatelessWidget {
  const CustomListViewCardOrderItem({super.key, required this.selectProdut});
  final List<ProductItem> selectProdut;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: selectProdut.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CardOrderItem(
              productItem: selectProdut[index],
            ),
          );
        },
      ),
    );
  }
}

import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.productitem,
    required this.title,
  });

  final List<ProductItem> productitem;
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.textStyleregular20poppins.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        if (productitem.isEmpty)
          const Center(
            child: Text(
              '',
              style: TextStyle(color: Colors.grey),
            ),
          )
        else
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productitem.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CardItem(
                  urlimg: productitem[index].imageUrl,
                  title: productitem[index].foodName,
                  cal: productitem[index].calories.toString(),
                  salary: productitem[index].totalPrice.toString(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:balancedmeal/core/utils/Images.dart';
import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/button_add.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_of_container_circule.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_title_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  CardItem({
    super.key,
    required this.title,
    required this.cal,
    required this.salary,
    required this.urlimg,
  });
  final String title, cal, salary, urlimg;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  List<ProductItem> productItems = [];

  @override
  Widget build(BuildContext context) {
    ProductItem productChoice = ProductItem(
      foodName: '',
      quantity: 0,
      totalPrice: 0,
      imageUrl: '',
      calories: 0,
    );
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3D898989),
              blurRadius: 15.5,
              offset: Offset(3, 4),
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            width: 163,
            height: 108,
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: widget.urlimg,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RowTitlAndDescription(
            title: widget.title,
            cal: widget.cal,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '\$${widget.salary}',
                style: AppStyle.textStylesemibold50016poppins,
              ),
              Spacer(),
              productItems.length < 1
                  ? ButtonAdd(
                      onTap: () {
                        productChoice = ProductItem(
                          foodName: widget.title,
                          quantity: 1,
                          totalPrice: int.parse(widget.salary),
                          imageUrl: widget.urlimg,
                          calories: int.parse(widget.cal),
                        );
                        productItems.add(productChoice);
                        setState(() {});
                      },
                    )
                  : RowOfContainerCircule(),
            ],
          ),
        ],
      ),
    );
  }
}

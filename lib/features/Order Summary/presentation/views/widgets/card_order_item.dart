import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/row_of_container_circule.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardOrderItem extends StatefulWidget {
  const CardOrderItem({
    super.key,
    required this.productItem,
    required this.onQuantityChanged,
  });

  final ProductItem productItem;
  final VoidCallback onQuantityChanged;

  @override
  State<CardOrderItem> createState() => _CardOrderItemState();
}

class _CardOrderItemState extends State<CardOrderItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.productItem.quantity;
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
    widget.productItem.quantity = newQuantity;
    widget.onQuantityChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 78,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3D898989),
            blurRadius: 15.5,
            offset: Offset(3, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              width: 76,
              height: 62,
              imageUrl: widget.productItem.imageUrl.isNotEmpty
                  ? widget.productItem.imageUrl
                  : 'https://www.daysoftheyear.com/cdn-cgi/image/dpr=1%2Cf=auto%2Cfit=cover%2Cheight=650%2Cq=40%2Csharpen=1%2Cwidth=956/wp-content/uploads/fresh-spinach-day.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.productItem.foodName,
                        style: AppStyle.textStylesemibold50016poppins,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${widget.productItem.totalPrice}',
                      style: AppStyle.textStylesemibold50016poppins,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cal ${widget.productItem.calories}',
                      style: AppStyle.textStylesemibold50014poppins
                          .copyWith(color: Colors.grey[700]),
                    ),
                    RowOfContainerCircule(
                      number: quantity,
                      onQuantityChanged: updateQuantity,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

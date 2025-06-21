import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/container_info_bottom.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/card_order_item.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/custom_list_view_card_order_item.dart';
import 'package:flutter/material.dart';

class OrderSmmaryViewBody extends StatelessWidget {
  const OrderSmmaryViewBody({
    super.key,
    required this.cal,
    required this.sumsallary,
    required this.sumcal,
    required this.selectProduct,
  });
  final List<ProductItem> selectProduct;
  final String cal;
  final String sumsallary;
  final String sumcal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                CustomListViewCardOrderItem(
                  selectProdut: selectProduct,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ContainerInfoBottom(
                titlebutton: 'Confirm',
                cal: cal,
                sumsallary: sumsallary,
                sumcal: sumcal,
                selectProduct: selectProduct,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/card_order_item.dart';
import 'package:flutter/material.dart';

class OrderSmmaryViewBody extends StatelessWidget {
  const OrderSmmaryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            CardOrderItem(),
          ],
        ),
      ),
    );
  }
}

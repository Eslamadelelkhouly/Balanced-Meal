import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/widgets/custom_app_bar.dart';
import 'package:balancedmeal/features/Home/data/models/product_model.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/order_smmary_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<ProductItem> selectProduct =
        data['selectProduct'] as List<ProductItem>;
    final String cal = data['cal'] as String;
    final String sumsallary = data['sumsallary'] as String;
    final String sumcal = data['sumcal'] as String;

    return Scaffold(
      backgroundColor: AppColor.whiteforgray.withOpacity(0.97),
      appBar: CustomAppbar(context, title: 'Order summary'),
      body: OrderSmmaryViewBody(
        cal: cal,
        sumcal: sumcal,
        sumsallary: sumsallary,
        selectProduct: selectProduct,
      ),
    );
  }
}

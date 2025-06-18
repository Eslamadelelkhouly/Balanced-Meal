import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:balancedmeal/core/widgets/custom_app_bar.dart';
import 'package:balancedmeal/features/Details%20Screen/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteforgray,
      appBar: CustomAppbar(context, title: 'Enter your details'),
      body: DetailsViewBody(),
    );
  }
}

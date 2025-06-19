import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/widgets/custom_app_bar.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteforgray.withOpacity(0.97),
      appBar: CustomAppbar(context, title: 'Create your order'),
      body: HomeViewBody(),
    );
  }
}

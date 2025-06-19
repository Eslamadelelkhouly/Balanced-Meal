import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/widgets/custom_app_bar.dart';
import 'package:balancedmeal/features/Home/presentation/manager/cubit/get_product_cubit.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double cal = GoRouterState.of(context).extra as double;
    return BlocProvider(
      create: (context) => GetProductCubit(),
      child: Scaffold(
        backgroundColor: AppColor.whiteforgray.withOpacity(0.97),
        appBar: CustomAppbar(context, title: 'Create your order'),
        body: HomeViewBody(
          cal: cal,
        ),
      ),
    );
  }
}

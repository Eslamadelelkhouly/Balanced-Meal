import 'package:balancedmeal/features/Details%20Screen/presentation/views/details_view.dart';
import 'package:balancedmeal/features/Home/presentation/views/home_view.dart';
import 'package:balancedmeal/features/Order%20Summary/presentation/views/widgets/order_smmary_view_body.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouterScreen {
  static const String splash = '/';
  static const String detials = '/details';
  static const String home = '/home';
  static const String orderSummary = '/orderSummary';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const WelcomView(),
      ),
      GoRoute(
        path: detials,
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: orderSummary,
        builder: (context, state) => const OrderSmmaryViewBody(),
      ),
    ],
  );
}

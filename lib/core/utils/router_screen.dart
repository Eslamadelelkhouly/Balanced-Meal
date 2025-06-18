import 'package:balancedmeal/features/Details%20Screen/presentation/views/details_screen.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouterScreen {
  static const String splash = '/';
  static const String detials = '/details';
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
    ],
  );
}

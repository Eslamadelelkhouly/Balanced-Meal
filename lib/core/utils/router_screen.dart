import 'package:balancedmeal/features/welcom%20screen/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouterScreen {
  static const String splash = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context,state) => const WelcomView(),
      ),
    ],
  );
}

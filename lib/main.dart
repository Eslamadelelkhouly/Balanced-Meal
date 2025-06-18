import 'package:balancedmeal/core/utils/router_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlancedMeal());
}

class BlancedMeal extends StatelessWidget {
  const BlancedMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Balanced Meal',
      debugShowCheckedModeBanner: false,
      routerConfig: RouterScreen.router,
    );
  }
}


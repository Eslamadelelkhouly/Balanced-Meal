import 'package:balancedmeal/features/welcom%20screen/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WelcomViewBody(),
    );
  }
}

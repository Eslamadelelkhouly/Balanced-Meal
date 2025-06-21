import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/router_screen.dart';
import 'package:balancedmeal/core/widgets/custpm_button.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/widgets/container_background.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/widgets/custom_description_container.dart';
import 'package:balancedmeal/features/welcom%20screen/presentation/views/widgets/gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomViewBody extends StatelessWidget {
  const WelcomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ContainerBackground(),
          GradiantContainer(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: MediaQuery.of(context).size.width * 0.05,
            child: CustomDiscriptionContainer(),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.05,
            child: CustomButton(
              statebutton: true,
              onPressed: () {
                GoRouter.of(context).push(RouterScreen.detials);
              },
              text: 'Order',
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              textColor: Colors.white,
              backgrounColor: AppColor.orange,
            ),
          ),
        ],
      ),
    );
  }
}

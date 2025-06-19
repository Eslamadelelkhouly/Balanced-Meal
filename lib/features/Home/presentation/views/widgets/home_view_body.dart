import 'package:balancedmeal/features/Home/presentation/views/widgets/container_info_bottom.dart';
import 'package:balancedmeal/features/Home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 150),
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const CustomListView(),
                  const SizedBox(height: 24),
                  const CustomListView(),
                  const SizedBox(height: 24),
                  const CustomListView(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ContainerInfoBottom(),
          ),
        ],
      ),
    );
  }
}

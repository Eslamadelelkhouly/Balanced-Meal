import 'package:balancedmeal/core/utils/app_color.dart';
import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteforgray,
      appBar: AppBar(
        elevation: 3,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        title: Text(
          'Enter your details',
          style: AppStyle.textStyleregular20poppins.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

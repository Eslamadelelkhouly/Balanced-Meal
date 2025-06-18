import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

AppBar CustomAppbar(BuildContext context, {required String title}) {
  return AppBar(
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
      '$title',
      style: AppStyle.textStyleregular20poppins.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
  );
}

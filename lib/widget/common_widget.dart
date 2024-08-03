import 'package:flutter/material.dart';
import 'package:mappage/constant/colors.dart';
import 'package:mappage/constant/constant.dart';
import 'package:mappage/constant/style.dart';

commonAapBar() {
  return AppBar(
    backgroundColor: AppColors.appbarColor,
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.keyboard_arrow_left, color: AppColors.black),
            onPressed: () {},
          ),
        ),
      ),
    ),
    title: const Text(Constants.appBarName, style: AppStyles.appBarTitleStyle),
  );
}

mapAapBar() {
  return AppBar(
    backgroundColor: AppColors.appbarColor,
    leading: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.keyboard_arrow_left, color: AppColors.black),
            onPressed: () {},
          ),
        ),
      ),
    ),
    title: const Text("Map Screen", style: AppStyles.appBarTitleStyle),
  );
}

labelText(String title) {
  return Text(title, style: AppStyles.labelTitleStyle);
}

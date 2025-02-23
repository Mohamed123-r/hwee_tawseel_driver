import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/app_colors.dart';
import '../../../generated/assets.dart';

AppBar appBarFromAuth(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    leadingWidth: 0,
    leading: SizedBox(),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1,
              color: AppColors.border,
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 60,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(Assets.imagesLogo),
            ),
          ),
        ),
      ],
    ),
  );
}

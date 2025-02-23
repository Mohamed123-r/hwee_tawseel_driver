import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.greyDarker,
      minWidth: 124,
      height: 42,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(120),
      ),
      child: Text(
        text,
        style: AppTextStyles.style10W700(context).copyWith(
          color: AppColors.white,
          fontFamily: 'Noto Kufi Arabic',
        ),
      ),
    );
  }
}

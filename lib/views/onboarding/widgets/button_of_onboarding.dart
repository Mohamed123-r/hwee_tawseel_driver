import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.titleColor,
    this.title = "التالي",
  });

  final Function() onPressed;
  final Color backgroundColor;
  final Color titleColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      minWidth: 64,
      height: 64,
      shape: const StadiumBorder(),
      child: Text(title!,
          style: AppTextStyles.style14W400(context)
              .copyWith(color: titleColor, fontFamily: "VEXA")),
    );
  }
}

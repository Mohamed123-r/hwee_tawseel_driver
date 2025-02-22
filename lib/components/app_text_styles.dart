import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle style32W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 32),
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style22W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style16W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style14W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style12W500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style12W700(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style10W500(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 10),
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle style10W700(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 10),
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );
  }
}

double getResponsiveScaleFactor(BuildContext context,
    {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 600) {
    // هذه هي حالة الأجهزة المحمولة، حيث عرض الشاشة عادة أقل من 600
    return width / 400;  // تعديل نسبة المقياس للأجهزة الصغيرة
  } else if (width <= 1200) {
    // للأجهزة اللوحية أو الشاشات المتوسطة
    return width / 1000;  // تعديل نسبة المقياس للأجهزة المتوسطة
  } else {
    // للشاشات الأكبر من 1200 مثل شاشات الكمبيوتر
    return width / 1750;  // نسبة مقياس الشاشات الكبيرة
  }
}


import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/views/splash/splash_view.dart';

import 'components/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: AppColors.textPrimary,
      ),
      home: SplashView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hwee_tawseel_driver/views/auth/auth_view.dart';
import 'package:hwee_tawseel_driver/views/main/main_view.dart';
import 'package:hwee_tawseel_driver/views/splash/splash_view.dart';

import 'components/app_colors.dart';
import 'views/home/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

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
      home: Scaffold(
        backgroundColor: AppColors.white ,
        body: MainView(),
      ),
    );
  }
}

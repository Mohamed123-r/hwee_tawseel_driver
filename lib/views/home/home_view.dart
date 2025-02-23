import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';



import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            HomeViewBody()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_alert_dialog.dart';
import '../../../components/app_colors.dart';
import '../../../components/app_text_styles.dart';
import 'widgets/app_bar_from_auth.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBarFromAuth(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              spacing: 16,
              children: [
                if (step == 1) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Map', style: AppTextStyles.style32W400(context)),
                    ],
                  ),
                ],
              ],
            ),
            Expanded(child: const SizedBox(height: 40)),
            AppButton(
              text: 'التالي',
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

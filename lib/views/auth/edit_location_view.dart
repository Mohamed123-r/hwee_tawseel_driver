import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_alert_dialog.dart';
import 'package:hwee_tawseel_driver/components/app_form_filed.dart';

import '../../../components/app_colors.dart';
import '../../../components/app_text_styles.dart';
import 'widgets/app_bar_from_auth.dart';

class EditLocationView extends StatefulWidget {
  const EditLocationView({super.key});

  @override
  State<EditLocationView> createState() => _EditLocationViewState();
}

class _EditLocationViewState extends State<EditLocationView> {
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
                if (step == 2) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'بيانات موقعك',
                        style: AppTextStyles.style12W500(context),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.greenDark),
                        child: Center(
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppInputTextFormField(labelText: "الدولة :"),
                  AppInputTextFormField(labelText: "المدينة :"),
                  AppInputTextFormField(labelText: "الحي :"),
                  AppInputTextFormField(labelText: "الشارع :"),
                  AppInputTextFormField(labelText: "رقم المبني :"),
                ],
              ],
            ),
            Expanded(child: const SizedBox(height: 40)),
            AppButton(
              text: 'التالي',
              onPressed: () {
                setState(() {
                  if (step == 1) {
                    step = 2;
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                        title:
                            'تم إنشاء الحساب بنجاح في إنتظار الموافقة علي طلب إنضمامك',
                        isSuccess: true,
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

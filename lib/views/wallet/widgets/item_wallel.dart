import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

class ItemWallet extends StatelessWidget {
  const ItemWallet({
    super.key,
    required this.name,
    required this.date,
    required this.price,
    required this.number,
  });

  final String name;

  final String date;

  final String price;

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم المرسل: $name",
                  style: AppTextStyles.style12W500(context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffFFDBC8),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: AppTextStyles.style10W500(context).copyWith(
                          fontFamily: "Lemonada"
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 44,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "مرسل من محفظتك مبلغ:",
                      style: AppTextStyles.style10W500(context).copyWith(
                        color: AppColors.greenWhite
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      " ${price} ريال سعودي",
                     style: AppTextStyles.style12W500(context)
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "المستلم:",
                      style: AppTextStyles.style10W500(context).copyWith(
                          color: AppColors.greenWhite
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      number,
                      style: AppTextStyles.style12W500(context)
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

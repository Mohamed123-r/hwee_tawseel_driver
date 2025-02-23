import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';

class ItemHome extends StatelessWidget {
  const ItemHome({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  status,
                  style: AppTextStyles.style12W500(context).copyWith(
                    color: AppColors.greenWhite,
                  ),
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greenDark,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesBox2,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Divider(
                color: AppColors.border,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "6/2/2025",
                      style: AppTextStyles.style12W500(context),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "الدمام",
                      style: AppTextStyles.style12W500(context),
                    ),
                  ],
                ),
                Icon(Icons.arrow_back),
                Column(
                  children: [
                    Text(
                      "6/2/2025",
                      style: AppTextStyles.style12W500(context),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "الرياض",
                      style: AppTextStyles.style12W500(context),
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

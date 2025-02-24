import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

import '../../generated/assets.dart';
import 'widgets/notification_item.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final List<Map<String, String>> notifications = [
    {
      "name": "Mohammed Ali",
      "phone": "+20 010255678902",
      "message": "مرحبًا به في غالي توصيل سجل بيانات وأداء طلبك",
      "image": "https://i.pravatar.cc/150?img=2"
    },
    {
      "name": "Mohammed Ali",
      "phone": "+20 010255678902",
      "message": "مرحبًا به في غالي توصيل سجل بيانات وأداء طلبك",
      "image": "https://i.pravatar.cc/150?img=2"
    },
    {
      "name": "Mohammed Ali",
      "phone": "+20 010255678902",
      "message": "مرحبًا به في غالي توصيل سجل بيانات وأداء طلبك",
      "image": "https://i.pravatar.cc/150?img=3"
    },
    {
      "name": "Mohammed Ali",
      "phone": "+20 010255678902",
      "message": "مرحبًا به في غالي توصيل سجل بيانات وأداء طلبك",
      "image": "https://i.pravatar.cc/150?img=4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text(
            "الاشعارات",
            style: AppTextStyles.style16W400(context).copyWith(
              color: AppColors.greenWhite,
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF9F9F9),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesBell,
                  width: 20,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 1,
                  color: AppColors.border,
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Divider(
              color: AppColors.border.withOpacity(0.5),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            final notification = notifications[index];
            return NotificationItem(notification: notification);
          },
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
  });

  final Map<String, String> notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(notification["image"]!),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification["name"]!,
                      style: AppTextStyles.style12W500(context)
                          .copyWith(fontFamily: "Noto Kufi Arabic"),
                    ),
                    Text(
                      notification["phone"]!,
                      style: AppTextStyles.style12W500(context)
                          .copyWith(fontFamily: "Noto Kufi Arabic"),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.circle,
                size: 10,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            notification["message"]!,
            style: AppTextStyles.style12W500(context).copyWith(
              fontFamily: "Noto Kufi Arabic",
              color: AppColors.border,
            ),
          ),
        ],
      ),
    );
  }
}

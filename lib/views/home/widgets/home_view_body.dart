import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';

import 'home_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "طلباتك اليوم",
                          style: AppTextStyles.style12W500(context),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "13",
                          style: AppTextStyles.style16W400(context)
                              .copyWith(fontFamily: "Noto Kufi Arabic"),
                        ),
                        Text(
                          " طلب توصيل",
                          style: AppTextStyles.style12W700(context).copyWith(
                              color: AppColors.greenWhite,
                              fontFamily: "Noto Kufi Arabic"),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 80,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "رصيدك اليوم",
                          style: AppTextStyles.style12W500(context),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1333",
                          style: AppTextStyles.style16W400(context)
                              .copyWith(fontFamily: "Noto Kufi Arabic"),
                        ),
                        Text(
                          " ريال سعودي",
                          style: AppTextStyles.style12W700(context).copyWith(
                              color: AppColors.greenWhite,
                              fontFamily: "Noto Kufi Arabic"),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFF464855),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(children: [
              Positioned(
                top: 0,
                right: 3,
                child: Image.asset(
                  Assets.imagesShapes,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "طلباتي",
                        style: AppTextStyles.style16W400(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        Assets.imagesBox,
                        width: 40,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SizedBox(height: 10),
          ItemHome(
            status: "المملكة العربية السعودية",
          ),
          SizedBox(height: 10),
          ItemHome(
            status: "المملكة العربية السعودية",
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

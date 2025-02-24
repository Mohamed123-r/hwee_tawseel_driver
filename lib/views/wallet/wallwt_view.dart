import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_alert_dialog.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

import '../../generated/assets.dart';
import '../notifications/notifications_view.dart';
import 'widgets/item_wallel.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 165,
            decoration: BoxDecoration(
              color: Color(0xff303030),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Assets.imagesShapesCards,
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Assets.imagesNoiseBackground,
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "رصيدك الحالي",
                              style: AppTextStyles.style10W500(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                            Image.asset(
                              Assets.imagesGroupCart,
                              width: 35,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "21.",
                              style: AppTextStyles.style16W400(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                            Text(
                              "5327",
                              style: AppTextStyles.style32W400(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                            Text(
                              "  ريال",
                              style: AppTextStyles.style12W500(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "تاريخ آخر معاملة:",
                              style: AppTextStyles.style10W500(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                            Text(
                              " 22 - 1 - 2023",
                              style: AppTextStyles.style10W500(context)
                                  .copyWith(
                                      color: AppColors.white,
                                      fontFamily: "Lemonada"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          MaterialButton(
            onPressed: () {
              double amount = 0.0;
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AppAlertDialog(
                        title: "تم إرسال طلبك بنجاح",
                        isSuccess: true,
                      );
                    },
                  );
                },
              );
            },
            padding: EdgeInsetsDirectional.zero,
            color: AppColors.greenDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text("طلب سحب الرصيد",
                    style: AppTextStyles.style14W400(context).copyWith(
                      color: AppColors.white,
                    )),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 38,
                  height: 38,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.greenWhite),
                  child: Center(
                      child: Icon(
                    Icons.north_east,
                    color: Colors.white,
                    size: 20,
                  )),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "آخر معاملاتي النقدية",
              style: AppTextStyles.style14W400(context).copyWith(
                color: AppColors.greenWhite,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ItemWallet(
                  name: "محمد علي عبد القادر",
                  date: "22 - 1 - 2023",
                  price: "5327.21 ",
                  number: " 01030152222",
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16);
              },
            ),
          ),
        ],
      ),
    );
  }
}

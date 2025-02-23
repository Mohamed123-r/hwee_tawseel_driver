import 'package:flutter/material.dart';

import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';
import 'package:hwee_tawseel_driver/views/auth/widgets/app_bar_from_auth.dart';

import 'widgets/login.dart';
import 'widgets/register.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBarFromAuth(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.imagesShap1,
                    ),
                    Image.asset(
                      Assets.imagesShap2,
                    ),
                  ],
                ),
                Container(
                  width: 240,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.greyDarker,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 300),
                        left: isLogin ? 0 : 120,
                        top: 0,
                        bottom: 0,
                        right: isLogin ? 120 : 0,
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.greenWhite,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 50,
                              // highlightColor: Colors.transparent,
                              // splashColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              onPressed: () {
                                setState(() {
                                  isLogin = true;
                                });
                              },
                              child: Text(
                                "تسجيل الدخول ",
                                style:
                                    AppTextStyles.style10W700(context).copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: MaterialButton(
                              height: 50,
                              // highlightColor: Colors.transparent,
                              // splashColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              onPressed: () {
                                setState(() {
                                  isLogin = false;
                                });
                              },
                              child: Text(
                                "انشاء حساب",
                                style:
                                    AppTextStyles.style10W700(context).copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: isLogin ? Login() : Register()),
          ],
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';
import 'package:hwee_tawseel_driver/views/home/home_view.dart';
import 'package:hwee_tawseel_driver/views/profile/profile_view.dart';

import 'bottom_nav_btn.dart';
import 'clipper.dart';
import 'size_config.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
            right: 16,
            left: 16,
          ),
          child: bottomNav(),
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox(),
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            spacing: 8,
            children: [
              Container(
                height: 48,
                padding: EdgeInsets.only(right: 2, left: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: AppColors.greenWhite,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Assets.imagesTest1),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "مرحبا",
                          style: AppTextStyles.style10W500(context).copyWith(
                            color: AppColors.greenWhite,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("محمد علي عبد القادر",
                            style: AppTextStyles.style10W500(context)),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF9F9F9),
                ),
                child: Center(
                    child: Text(
                  "AR",
                  style: AppTextStyles.style10W500(context),
                )),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(Assets.imagesLogo),
                ),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomeView(),
                  Container(
                    color: Colors.yellow,
                  ),
                  ProfileView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          height: AppSizes.blockSizeHorizontal * 18,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: AppSizes.blockSizeHorizontal * 3,
                right: AppSizes.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBTN(
                      title: "الطلبات",
                      onPressed: (val) {
                        animateToPage(val);
                      },
                      icon: Assets.imagesBox2,
                      currentIndex: _currentIndex,
                      index: 0,
                    ),
                    BottomNavBTN(
                      title: "المحفظة",
                      onPressed: (val) {
                        animateToPage(val);
                      },
                      icon: Assets.imagesWallet,
                      currentIndex: _currentIndex,
                      index: 1,
                    ),
                    BottomNavBTN(
                      title: "حسابي",
                      onPressed: (val) {
                        animateToPage(val);
                      },
                      icon: Assets.imagesUser,
                      currentIndex: _currentIndex,
                      index: 2,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                top: 0,
                left: animatedPositionedLEftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1.0,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradient,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Color> gradient = [
  Colors.orange.withOpacity(0.5),
  Colors.orange.withOpacity(0.2),
  Colors.transparent
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 68.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 40;
    case 2:
      return AppSizes.blockSizeHorizontal * 11;
    default:
      return 0;
  }
}

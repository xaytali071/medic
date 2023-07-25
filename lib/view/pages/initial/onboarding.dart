import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../companents/app_assets.dart';
import '../../companents/style.dart';
import '../../medic_route.dart';


List<String> titles = [
  "Welcome",
  "Order Medicine",
  "Doctor Consultation",
  "Fast Delivery"
];
List<String> descriptions = [
  "Dummy text used in laying out print, graphic or web designs. The passage is  very good an unknown",
  "Dummy text used in laying out print, graphic or web designs. The passage is  very good an unknown",
  "Dummy text used in laying out print, graphic or web designs. The passage is  very good an unknown",
  "Dummy text used in laying out print, graphic or web designs. The passage is  very good an unknown",
];

class OnBoardingMedicalPage extends ConsumerStatefulWidget {
  const OnBoardingMedicalPage({super.key});

  @override
  ConsumerState<OnBoardingMedicalPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingMedicalPage> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String value = 'Next';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: PageView.builder(
              controller: pageController,
              itemCount: titles.length,
              onPageChanged: (s) {
                index = s;
                setState(() {});
                if (s - 1 == titles.length - 2) {
                  value = 'Sign in';
                } else {
                  value = 'Next';
                }
              },
              itemBuilder: (context, index) {
                return Container(
                  color: GMedicalStyle.blue,
                  padding: EdgeInsets.only(left: 32.r, right: 32.r, top: 32.r),
                  child: Image.asset(
                    index == 0
                        ? Assets.gMedicalFirstSplash
                        : index == 1
                            ? Assets.gMedical2Splash
                            : index == 2
                                ? Assets.gMedical3Splash
                                : Assets.gMedical4Splash,
                    fit: BoxFit.scaleDown,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: GMedicalStyle.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r))),
              child: SafeArea(
                child: Column(
                  children: [
                    32.verticalSpace,
                    SizedBox(
                      width: 380.w,
                      child: Column(
                        children: [
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              titles[index],
                              style: GMedicalStyle.urbanistBold(
                                  color: GMedicalStyle.lightGrey, size: 32),
                            ),
                          ),
                          12.verticalSpace,
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              descriptions[index],
                              textAlign: TextAlign.center,
                              style: GMedicalStyle.urbanistMedium(
                                size: 16,
                                color: GMedicalStyle.greyscale700,
                              ),
                            ),
                          ),
                          64.verticalSpace,
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        24.horizontalSpace,
                        SizedBox(
                            height: 20.r,
                            child: SmoothPageIndicator(
                                controller: pageController,
                                count: titles.length,
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 2.2,
                                  dotWidth: 16.r,
                                  strokeWidth: 12.r,
                                  spacing: 18,
                                  dotHeight: 16.r,
                                  activeDotColor: GMedicalStyle.success,
                                  dotColor: GMedicalStyle.greyscale300,
                                  paintStyle: PaintingStyle.fill,
                                ),
                                onDotClicked: (index) {})),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              setState(() {});
                              pageController.page?.toInt() != titles.length - 1
                                  ? pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 450),
                                      curve: Curves.easeInOut,
                                    )
                                  : GMedicalRoute.goSignUp(context);
                              if (pageController.page?.toInt() ==
                                  titles.length - 2) {
                                value = 'Sign in';
                              } else {
                                value = 'Next';
                              }
                            },
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: GMedicalStyle.success,
                              ),
                            )),
                        12.horizontalSpace,
                      ],
                    ),
                    50.verticalSpace
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../companents/app_assets.dart';
import '../../../companents/style.dart';

class ReviewsChart extends StatelessWidget {
  const ReviewsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '4.8',
                style: GMedicalStyle.urbanistBold(size: 48),
              ),
              14.verticalSpace,
              SizedBox(
                height: 22.r,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: REdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        index != 4 ? Assets.svgStar : Assets.svgSemiStar,
                        height: 20.r,
                        width: 20.r,
                        color: GMedicalStyle.primary,
                      ),
                    );
                  },
                ),
              ),
              14.verticalSpace,
              Text(
                '(4.8k reviews)',
                style: GMedicalStyle.urbanistMedium(size: 18),
              )
            ],
          ),
          SizedBox(
            height: 142.h,
            child: const VerticalDivider(
              color: GMedicalStyle.grey,
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '5',
                    style: GMedicalStyle.urbanistBold(size: 16),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8),
                    child: Container(
                      padding: REdgeInsets.only(right: 20),
                      width: 175.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                          color: GMedicalStyle.greyscale300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 6.r,
                        decoration: BoxDecoration(
                            color: GMedicalStyle.primary,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    '4',
                    style: GMedicalStyle.urbanistBold(size: 16),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8),
                    child: Container(
                      padding: REdgeInsets.only(right: 55),
                      width: 175.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                          color: GMedicalStyle.greyscale300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 6.r,
                        decoration: BoxDecoration(
                            color: GMedicalStyle.primary,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    '3',
                    style: GMedicalStyle.urbanistBold(size: 16),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8),
                    child: Container(
                      padding: REdgeInsets.only(right: 150),
                      width: 175.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                          color: GMedicalStyle.greyscale300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 6.r,
                        decoration: BoxDecoration(
                            color: GMedicalStyle.primary,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    '2',
                    style: GMedicalStyle.urbanistBold(size: 16),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8),
                    child: Container(
                      padding: REdgeInsets.only(right: 130),
                      width: 175.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                          color: GMedicalStyle.greyscale300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 6.r,
                        decoration: BoxDecoration(
                            color: GMedicalStyle.primary,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    '1',
                    style: GMedicalStyle.urbanistBold(size: 16),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8),
                    child: Container(
                      padding: REdgeInsets.only(right: 155),
                      width: 175.r,
                      height: 6.r,
                      decoration: BoxDecoration(
                          color: GMedicalStyle.greyscale300,
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 6.r,
                        decoration: BoxDecoration(
                            color: GMedicalStyle.primary,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

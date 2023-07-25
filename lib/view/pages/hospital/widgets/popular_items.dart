import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/custom/buttons/like_button.dart';
import '../../../companents/style.dart';


class PopularItems extends StatelessWidget {
  final String title, rating, status, img;
  final int price;
  final bool isStatus;
  final bool isOnCart;
  final bool isLike;
  final VoidCallback onLike;

  const PopularItems({
    super.key,
    required this.title,
    required this.rating,
    required this.price,
    required this.status,
    required this.img,
    required this.isStatus,
    required this.isOnCart,
    required this.isLike,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(right: 16),
      width: 182.r,
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  isOnCart ? GMedicalStyle.primary : GMedicalStyle.transparent),
          borderRadius: BorderRadius.circular(28.r),
          color: GMedicalStyle.white,
          boxShadow: GMedicalStyle.boxShadow),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            14.verticalSpace,
            CustomImage(
              url: img,
              height: 154,
              width: 154,
              radius: 20,
            ),
            12.verticalSpace,
            Text(
              title,
              style: GMedicalStyle.urbanistBold(size: 18),
            ),
            13.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(Assets.svgStar),
                6.horizontalSpace,
                Text(
                  rating,
                  style: GMedicalStyle.urbanistMedium(size: 12),
                ),
                6.horizontalSpace,
                Text(
                  '200 Reviews',
                  style: GMedicalStyle.urbanistMedium(size: 12),
                )
              ],
            ),
            6.verticalSpace,
            Text(
              status,
              style: GMedicalStyle.urbanistMedium(size: 14),
            ),
            13.verticalSpace,
            Row(
              children: [
                Text(
                  NumberFormat.currency(
                          locale: 'en_US', symbol: "N", decimalDigits: 0)
                      .format(price),
                  style: GMedicalStyle.urbanistBold(
                      size: 18, color: GMedicalStyle.primary),
                ),
                const Spacer(),
                LikeButton(onTap: onLike, isLike: isLike),
              ],
            )
          ],
        ),
      ),
    );
  }
}

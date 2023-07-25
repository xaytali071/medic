// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';

class UsersComment extends StatelessWidget {
  final String img, name, lastName, comment, likesCount, time;
  final int index;

  const UsersComment(
      {super.key,
      required this.img,
      required this.name,
      required this.lastName,
      required this.comment,
      required this.likesCount,
      required this.time,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        25.verticalSpace,
        Row(
          children: [
            CustomImage(
              url: img,
              height: 48,
              width: 48,
              radius: 100,
            ),
            16.horizontalSpace,
            Text(
              '$name $lastName',
              style: GMedicalStyle.urbanistBold(size: 16),
            ),
            const Spacer(),
            SvgPicture.asset(Assets.svgStar, color: GMedicalStyle.primary),
            8.horizontalSpace,
            SvgPicture.asset(Assets.svgStar, color: GMedicalStyle.primary),
            8.horizontalSpace,
            SvgPicture.asset(Assets.svgStar, color: GMedicalStyle.primary),
            8.horizontalSpace,
            SvgPicture.asset(Assets.svgStar, color: GMedicalStyle.primary),
            8.horizontalSpace,
            Padding(
              padding: REdgeInsets.only(right: 16),
              child: index == 0
                  ? SvgPicture.asset(
                      Assets.svgSemiStar,
                      height: 13.r,
                      width: 13.r,
                      color: GMedicalStyle.primary,
                    )
                  : SvgPicture.asset(
                      Assets.svgStar,
                      color: GMedicalStyle.primary,
                    ),
            ),
            SvgPicture.asset(Assets.svgMoreCircle)
          ],
        ),
        12.verticalSpace,
        Text(
          comment,
          style: GMedicalStyle.urbanistMedium(size: 14),
        ),
        14.verticalSpace,
        Row(
          children: [
            SvgPicture.asset(Assets.svgLike),
            10.horizontalSpace,
            Text(
              likesCount,
              style: GMedicalStyle.urbanistMedium(size: 12),
            ),
            24.horizontalSpace,
            Text(
              time,
              style: GMedicalStyle.urbanistMedium(
                  size: 12, color: GMedicalStyle.greyscale700),
            ),
          ],
        )
      ],
    );
  }
}

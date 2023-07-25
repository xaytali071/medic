// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medic/view/companents/app_assets.dart';

import '../../../companents/style.dart';

class PatientsItem extends StatelessWidget {
  final int? count;

  const PatientsItem({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: REdgeInsets.only(top: 20),
          padding: REdgeInsets.only(
            left: 48,
            right: 20,
            top: 28,
            bottom: 20,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: GMedicalStyle.primary.withOpacity(0.25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${count ?? ''}",
                style: GMedicalStyle.urbanistSemiBold(
                  size: 22,
                ),
              ),
              4.verticalSpace,
              Text(
                "Total Patients",
                style: GMedicalStyle.urbanistMedium(
                    size: 12, color: GMedicalStyle.greyscale800),
              ),
            ],
          ),
        ),
        Positioned(
          left: 14.r,
          child: Container(
              height: 54.r,
              width: 54.r,
              decoration: const BoxDecoration(
                color: GMedicalStyle.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.svgPatient,
                  color: GMedicalStyle.white,
                  height: 24.r,
                ),
              )),
        )
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/view/companents/custom/buttons/button_effect.dart';
import 'package:medic/view/companents/style.dart';


class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
     this.color= GMedicalStyle.greyscale900,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: REdgeInsets.symmetric(vertical: 12,horizontal: 12),

          decoration: BoxDecoration(
            color: GMedicalStyle.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                height: 24.r,
                width: 24.r,
                color: color,
              ),
              const Spacer(),
              Text(
                title,
                style: GMedicalStyle.urbanistSemiBold(size: 16,color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

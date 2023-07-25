// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../companents/custom/buttons/button_effect.dart';
import '../../../companents/style.dart';


class ShopItem extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final VoidCallback onTap;
  final bool isActive;
  final Color? color;

  const ShopItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isActive = true,
    this.color,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 4, horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 20.r,
                    width: 20.r,
                    color: color ?? GMedicalStyle.primary,
                  ),
                  20.horizontalSpace,
                  Text(
                    title,
                    style: GMedicalStyle.urbanistSemiBold(size: 19),
                  ),
                  12.horizontalSpace,
                  Text(
                    desc,
                    style: GMedicalStyle.urbanistMedium(
                      size: 16,
                      color: GMedicalStyle.greyscale700,
                    ),
                  ),
                  const Spacer(),
                  isActive
                      ? Icon(
                          Icons.arrow_forward_ios,
                          size: 20.r,
                          color: GMedicalStyle.black,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              16.verticalSpace,
              const Divider(
                color: GMedicalStyle.greyscale200,
                thickness: 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

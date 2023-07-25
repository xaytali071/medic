import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/button_effect.dart';
import '../../../companents/style.dart';


class ContactItems extends StatelessWidget {
  final bool isSvg;
  final IconData? icon;
  final String title;

  const ContactItems(
      {super.key, this.icon, required this.title, this.isSvg = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24),
      child: ButtonsEffect(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: GMedicalStyle.white,
              boxShadow: GMedicalStyle.boxShadow,
              borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: REdgeInsets.all(26),
            child: Row(
              children: [
                isSvg
                    ? SvgPicture.asset(
                        Assets.svgTiktok,
                        height: 20.r,
                        width: 20.r,
                        // ignore: deprecated_member_use
                        color: GMedicalStyle.primary,
                      )
                    : Icon(
                        icon,
                        color: GMedicalStyle.primary,
                      ),
                18.horizontalSpace,
                Text(
                  title,
                  style: GMedicalStyle.urbanistBold(size: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

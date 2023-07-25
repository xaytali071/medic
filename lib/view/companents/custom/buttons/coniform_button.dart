import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';
import '../custom_loading.dart';
import 'button_effect.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  final bool isActive;
  final bool isBlue;
  final Color? color;
  final double height;
  final TextStyle? style;

  const ConfirmButton({
    Key? key,
    required this.onTap,
    this.isLoading = false,
    required this.title,
    this.isActive = true,
    this.height = 58,
    this.style,
    this.color,
    this.isBlue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsEffect(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: isLoading ? null : onTap,
        child: Container(
          height: height.r,
          width: isBlue ? null : double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: isBlue
                ? GMedicalStyle.primary
                : isActive
                ? GMedicalStyle.success
                : color ?? GMedicalStyle.secondary200,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
              child: CustomLoading(
                isLoading: isLoading,
                color: GMedicalStyle.white,
                size: 26,
                child: Text(title,
                    style: style?.copyWith(
                        color: isActive
                            ? GMedicalStyle.white
                            : GMedicalStyle.greyscale900) ??
                        GMedicalStyle.urbanistSemiBold(
                            size: 16,
                            color: isBlue
                                ? GMedicalStyle.white
                                : isActive
                                ? GMedicalStyle.white
                                : GMedicalStyle.greyscale900)),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';
import '../custom_loading.dart';
import 'button_effect.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key? key,
    required this.onTap,
    this.isLoading = false,
    required this.title,
    required this.isActive,
    this.height = 32,
    this.style,
  }) : super(key: key);
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  final bool isActive;
  final double height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ButtonsEffect(
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: isLoading ? null : onTap,
        child: Container(
          height: height.r,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isActive ? GMedicalStyle.primary : null,
            border: Border.all(
              color: isActive ? GMedicalStyle.transparent : GMedicalStyle.primary,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
              child: CustomLoading(
                isLoading: isLoading,
                color: GMedicalStyle.white,
                size: 26,
                child: Text(
                  title,
                  style: style?.copyWith(
                    color: isActive ? GMedicalStyle.white : GMedicalStyle.primary,
                  ) ??
                      GMedicalStyle.urbanistSemiBold(
                        size: 14,
                        color: isActive ? GMedicalStyle.white : GMedicalStyle.primary,
                      ),
                ),
              )),
        ),
      ),
    );
  }
}

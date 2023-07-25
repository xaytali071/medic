import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const CustomCheckbox({Key? key, required this.isActive, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 26.r,
        height: 26.r,
        decoration: BoxDecoration(
          color: isActive ? GMedicalStyle.primary : GMedicalStyle.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 2,
            color: isActive
                ? GMedicalStyle.transparent
                : GMedicalStyle.primary,
          ),
        ),
        duration: const Duration(milliseconds: 300),
        child: isActive
            ? Icon(
          FlutterRemix.check_fill,
          color: GMedicalStyle.white,
          size: 18.r,
        )
            : const SizedBox.shrink(),
      ),
    );
  }
}

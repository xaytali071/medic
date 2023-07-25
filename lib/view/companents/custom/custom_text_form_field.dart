import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? hintText;
  final int radius;
  final Color color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool isPadding;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.validator,
    this.hintText,
    this.radius = 8,
    this.color = GMedicalStyle.search,
    this.prefixIcon,
    this.onEditingComplete,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.obscureText = false,
    this.isPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      maxLines: isPadding ? 2 : 1,
      controller: controller,
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      validator: validator,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      onChanged: onChanged,
      cursorColor: GMedicalStyle.primary,
      style: GMedicalStyle.urbanistSemiBold(size: 16),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: const BorderSide(color: GMedicalStyle.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: const BorderSide(color: GMedicalStyle.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: const BorderSide(color: GMedicalStyle.transparent),
        ),
        contentPadding: isPadding
            ? REdgeInsets.only(top: 20, bottom: 50, left: 20)
            : REdgeInsets.symmetric(horizontal: 12),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.r),
        fillColor: color,
        filled: true,
        hintText: hintText,
        hintStyle: isPadding
            ? GMedicalStyle.urbanistMedium(color: GMedicalStyle.black, size: 14)
            : GMedicalStyle.urbanistRegular(color: GMedicalStyle.greyscale500, size: 14),
        prefixIcon: prefixIcon,
        prefixIconColor: GMedicalStyle.greyscale500,
        suffixIconColor: GMedicalStyle.greyscale500,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

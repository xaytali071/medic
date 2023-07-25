import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medic/view/companents/custom/buttons/button_effect.dart';
import 'package:medic/view/companents/style.dart';


class SearchButton extends StatelessWidget {
  final String title;
  final ValueChanged onTap;

  const SearchButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 12),
      child: ButtonsEffect(
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => onTap(title),
          child: Container(
            decoration: BoxDecoration(
                color: GMedicalStyle.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: GMedicalStyle.primary,
                )),
            padding: REdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              title,
              style: GMedicalStyle.urbanistSemiBold(size: 16, color: GMedicalStyle.primary),
            ),
          ),
        ),
      ),
    );
  }
}

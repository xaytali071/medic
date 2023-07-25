import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style.dart';



class ModalWrap extends StatelessWidget {
  final Widget body;

  const ModalWrap({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.r)
        ),
        color: GMedicalStyle.white,
        boxShadow: [
          BoxShadow(
            color: GMedicalStyle.blackColor.withOpacity(0.25),
            offset: const Offset(0, -2),
            blurRadius: 40,
            spreadRadius: 0,
          ),
        ],
      ),
      child: body,
    );
  }
}

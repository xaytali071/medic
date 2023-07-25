import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style.dart';

class ModalDrag extends StatelessWidget {
  const ModalDrag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          6.verticalSpace,
          Container(
            width: 48.r,
            height: 4.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: GMedicalStyle.greyscale300,
            ),
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}

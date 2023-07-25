import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_assets.dart';
import 'button_effect.dart';


class LikeButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLike;

  const LikeButton({Key? key, required this.onTap, required this.isLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsEffect(
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        onTap: onTap,
        child: Padding(
          padding: REdgeInsets.all(6),
          child: SvgPicture.asset(
            isLike ? Assets.svgLikeFill : Assets.svgLike,
            height: 22.r,
            width: 22.r,
          ),
        ),
      ),
    );
  }
}

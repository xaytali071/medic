import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:medic/view/companents/app_assets.dart';
import 'package:medic/view/companents/custom/buttons/custom_network_image.dart';


class Avatar extends StatelessWidget {
  final String? src;

  const Avatar({Key? key, this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (src?.isNotEmpty ?? false)
        ? CustomImage(url: src, height: 160, width: 160, radius: 100)
        : Image.asset(
            Assets.pngNoAvatar,
            height: 160.r,
            width: 160.r,
          );
  }
}

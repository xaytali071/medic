import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';



class EmptyOrders extends StatelessWidget {
  final String title;
  const EmptyOrders({Key? key,  this.title=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomImage(url: Assets.pngNoItem, height: 273, width: 280),
        40.verticalSpace,
        Text(
          "Empty",
          style: GMedicalStyle.urbanistSemiBold(size: 21),
        ),
        12.verticalSpace,
        Text(
          "You do not have an ${title.toLowerCase()} order at this time",
          style: GMedicalStyle.urbanistRegular(),
        )
      ],
    );
  }
}

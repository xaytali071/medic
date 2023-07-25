import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../model/models/product_data.dart';
import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';

class DoctorsWidget extends StatelessWidget {
  final ProductData? shop;

  const DoctorsWidget({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 16),
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: GMedicalStyle.white,
        boxShadow: const [
          BoxShadow(
            color: GMedicalStyle.greyscale50,
            offset: Offset(0, 4),
            blurRadius: 60,
          ),
        ],
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CustomImage(
                url: shop?.img,
                height: 120,
                width: 120,
                radius: 20,
              ),
            ],
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    shop?.name ?? "",
                    style: GMedicalStyle.urbanistBold(size: 17),
                    maxLines: 2,
                  ),
                ),
                12.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          shop?.location ?? "",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "|",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                        ),
                      ),
                      SvgPicture.asset(Assets.svgStar),
                      4.horizontalSpace,
                      Text(
                        "${shop?.rate ?? 0}",
                        style: GMedicalStyle.urbanistMedium(
                          color: GMedicalStyle.greyscale700,
                          size: 14,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        "(${shop?.order ?? 0})",
                        style: GMedicalStyle.urbanistMedium(
                          color: GMedicalStyle.greyscale700,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

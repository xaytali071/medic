
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../model/models/product_data.dart';
import '../../medic_route.dart';
import '../app_assets.dart';
import '../style.dart';
import 'buttons/custom_network_image.dart';
import 'buttons/like_button.dart';



class SearchItem extends StatelessWidget {
  final ProductData productData;
  final VoidCallback onLike;
  final bool isLike;

  const SearchItem({
    Key? key,
    required this.productData,
    required this.onLike,
    required this.isLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GMedicalRoute.goToProductPage(context, doctor: productData),
      child: Container(
        margin: REdgeInsets.only(bottom: 16),
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: GMedicalStyle.white,
          boxShadow: GMedicalStyle.boxShadow,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CustomImage(
                  url: productData.img,
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
                      productData.name ?? "",
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
                            productData.hospital?.name ?? "",
                            style: GMedicalStyle.urbanistMedium(
                              color: GMedicalStyle.greyscale700,
                              size: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        6.horizontalSpace,
                        Text(
                          "|",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                        ),
                        4.horizontalSpace,
                        SvgPicture.asset(Assets.svgStar),
                        4.horizontalSpace,
                        Text(
                          "${productData.rate ?? " "}",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                        ),
                        6.horizontalSpace,
                        Text(
                          "(${productData.order ?? 0})",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                        ),
                        8.horizontalSpace,
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                            locale: 'en_US', symbol: "N", decimalDigits: 0)
                            .format(productData.price ?? 0),
                        style:
                        GMedicalStyle.urbanistBold(color: GMedicalStyle.primary, size: 20),
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "|",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 12,
                          ),
                        ),
                      ),
                      LikeButton(onTap: onLike, isLike: isLike),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

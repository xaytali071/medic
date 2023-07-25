import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../model/models/product_data.dart';
import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/custom/buttons/like_button.dart';
import '../../../companents/style.dart';


class PlayTimeItems extends ConsumerWidget {
  final ProductData product;
  final bool isOnCart;
  final bool isLike;
  final VoidCallback onLike;

  const PlayTimeItems({
    super.key,
    required this.isOnCart,
    required this.product,
    required this.onLike,
    required this.isLike,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: REdgeInsets.only(bottom: 16),
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: isOnCart ? GMedicalStyle.primary : GMedicalStyle.transparent),
        color: GMedicalStyle.white,
        boxShadow: GMedicalStyle.boxShadow,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CustomImage(
                url: product.img,
                height: 120,
                width: 120,
                radius: 20,
              ),
              if (product.job?.isNotEmpty ?? false)
                Positioned(
                  top: 12.r,
                  left: 12.r,
                  child: Container(
                    padding: REdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: GMedicalStyle.primary
                    ),
                    child: Text(
                      product.job ?? "",
                      style:
                          GMedicalStyle.urbanistSemiBold(size: 10, color: GMedicalStyle.white),
                    ),
                  ),
                )
            ],
          ),
          16.horizontalSpace,
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      product.name ?? "",
                      style: GMedicalStyle.urbanistBold(size: 17),
                      maxLines: 2,
                    ),
                  ),
                  12.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        4.horizontalSpace,
                        SvgPicture.asset(Assets.svgStar),
                        4.horizontalSpace,
                        Text(
                          "${product.rate ?? " "}",
                          style: GMedicalStyle.urbanistMedium(
                            color: GMedicalStyle.greyscale700,
                            size: 14,
                          ),
                        ),
                        6.horizontalSpace,
                        Text(
                          "${product.order ?? 0} Reviews",
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
                            .format(product.price ?? 0),
                        style:
                            GMedicalStyle.urbanistBold(color: GMedicalStyle.primary, size: 20),
                      ),
                      const Spacer(),
                      LikeButton(onTap: onLike, isLike: isLike),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

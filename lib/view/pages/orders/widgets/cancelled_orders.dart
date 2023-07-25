import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../controller/shop/shop_provider.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';


class CancelledOrders extends ConsumerWidget {
  const CancelledOrders({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final shops = ref.watch(shopProvider).shops;
    return ListView(
      padding: REdgeInsets.symmetric(vertical: 24),
      children: [
        Container(
          padding: REdgeInsets.all(14),
          decoration: BoxDecoration(
            color: GMedicalStyle.white,
            boxShadow: GMedicalStyle.boxShadow,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomImage(
                    url: shops.first.img,
                    height: 120,
                    width: 120,
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shops.first.name ?? "",
                          style: GMedicalStyle.urbanistBold(size: 20),
                        ),
                        12.verticalSpace,
                        Text(
                          "3 items  | ${shops.first.location?.title}",
                          style: GMedicalStyle.urbanistMedium(
                            size: 14,
                            color: GMedicalStyle.greyscale700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'en_US',
                                      symbol: "N",
                                      decimalDigits: 0)
                                  .format(35000000),
                              style: GMedicalStyle.urbanistBold(
                                size: 18,
                                color: GMedicalStyle.primary,
                              ),
                            ),
                            12.horizontalSpace,
                            Container(
                              padding: REdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: GMedicalStyle.transparent,
                                border: Border.all(
                                  color: GMedicalStyle.error,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                "Cancelled",
                                style: GMedicalStyle.urbanistSemiBold(
                                  size: 12,
                                  color: GMedicalStyle.error,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../controller/chat/chat_provider.dart';
import '../../../../controller/product/product_provider.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/custom/buttons/custom_outline_button.dart';
import '../../../companents/style.dart';
import '../../../medic_route.dart';


class ActiveOrders extends ConsumerWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final shops = ref.watch(productProvider).products;
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
                    url: shops.last.img,
                    height: 120,
                    width: 120,
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shops.last.name ?? "",
                          style: GMedicalStyle.urbanistBold(size: 20),
                        ),
                        12.verticalSpace,
                        Text(
                          "3 items  | ${shops.last.name}",
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
                                  .format(165000),
                              style: GMedicalStyle.urbanistBold(
                                size: 18,
                                color: GMedicalStyle.primary,
                              ),
                            ),
                            12.horizontalSpace,
                            Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                  color: GMedicalStyle.primary,
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: Text(
                                "Paid",
                                style: GMedicalStyle.urbanistSemiBold(
                                  size: 12,
                                  color: GMedicalStyle.white,
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
              16.verticalSpace,
              const Divider(),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomOutlineButton(
                      onTap: () {
                        ref.read(chatProvider.notifier).selectShop(shops.last);
                        GMedicalRoute.goChat(context);
                      },
                      title: "Contact Seller",
                      isActive: false,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: CustomOutlineButton(
                      onTap: () {},
                      title: "Track Order",
                      isActive: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

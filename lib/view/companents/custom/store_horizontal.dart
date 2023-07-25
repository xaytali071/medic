import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/models/shop_data.dart';
import '../../medic_route.dart';
import '../style.dart';
import 'buttons/coniform_button.dart';
import 'buttons/custom_network_image.dart';

class StoreHorizontal extends StatelessWidget {
  final ShopData hospital;
  final VoidCallback onLike;
  final bool isLike;

  const StoreHorizontal(
      {Key? key,
        required this.hospital,
        required this.onLike,
        required this.isLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GMedicalRoute.goToShopPage(context, hospital: hospital),
      child: Container(
        width: MediaQuery.sizeOf(context).width - 36,
        padding: EdgeInsets.only(right: 12.r),
        margin: REdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: GMedicalStyle.white,
            boxShadow: GMedicalStyle.boxShadow),
        child: Row(
          children: [
            CustomImage(
              url: hospital.img,
              height: double.infinity,
              width: 124,
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital.location?.title ?? "",
                      style: GMedicalStyle.urbanistSemiBold(
                        size: 12,
                        color: GMedicalStyle.primary,
                      ),
                      maxLines: 1,
                    ),
                    8.verticalSpace,
                    Text(
                      hospital.name ?? "",
                      style: GMedicalStyle.urbanistSemiBold(
                        size: 20,
                        color: GMedicalStyle.black,
                      ),
                      maxLines: 1,
                    ),
                    4.verticalSpace,
                    Text(
                      hospital.openDays?[0].hours ?? "",
                      style: GMedicalStyle.urbanistSemiBold(
                          size: 14, color: GMedicalStyle.grey),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConfirmButton(
                          onTap: () {},
                          isBlue: true,
                          title: "Get appointment",
                          height: 44,
                        ),
                      ],
                    ),
                    6.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

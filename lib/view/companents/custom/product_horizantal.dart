import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/models/product_data.dart';
import '../../medic_route.dart';
import '../style.dart';
import 'buttons/coniform_button.dart';
import 'buttons/custom_network_image.dart';



class ProductHorizontal extends StatelessWidget {
  final ProductData doctor;
  final VoidCallback onLike;
  final bool isLike;
  final int index;

  const ProductHorizontal({
    Key? key,
    required this.doctor,
    required this.onLike,
    required this.isLike,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GMedicalRoute.goToProductPage(context, doctor: doctor),
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
            CustomImage(url: doctor.img, height: double.infinity, width: 124),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.job ?? "",
                      style: GMedicalStyle.urbanistSemiBold(
                        size: 14,
                        color: GMedicalStyle.primary,
                      ),
                      maxLines: 1,
                    ),
                    8.verticalSpace,
                    Text(
                      doctor.name ?? "",
                      style: GMedicalStyle.urbanistSemiBold(
                        size: 20,
                        color: GMedicalStyle.black,
                      ),
                      maxLines: 2,
                    ),
                    4.verticalSpace,
                    Text(
                      doctor.workTime ?? "",
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

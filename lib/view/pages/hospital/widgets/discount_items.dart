import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../controller/payment/payment_provider.dart';
import '../../../companents/custom/buttons/button_effect.dart';
import '../../../companents/style.dart';

class DiscountItems extends StatelessWidget {
  final int? index;
  final String title, description, icon;
  final bool isActive;
  const DiscountItems(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      this.isActive = false,
      this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(paymentProvider);
            final event = ref.watch(paymentProvider.notifier);
            return ButtonsEffect(
              child: GestureDetector(
                onTap: () => event.setSelectedDiscountsIndex(index: index ?? 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: GMedicalStyle.greyscale50,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: REdgeInsets.all(16),
                    child: Row(
                      children: [
                        SvgPicture.asset(icon),
                        28.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GMedicalStyle.urbanistBold(size: 18),
                            ),
                            8.verticalSpace,
                            Text(
                              description,
                              style: GMedicalStyle.urbanistRegular(
                                  size: 14, color: GMedicalStyle.greyscale700),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (isActive)
                          Container(
                              padding: REdgeInsets.all(2),
                              height: 20.r,
                              width: 20.r,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: GMedicalStyle.primary, width: 2.5)),
                              child: state.selectedDiscountsIndex == index
                                  ? Container(
                                      decoration: const BoxDecoration(
                                          color: GMedicalStyle.primary,
                                          shape: BoxShape.circle),
                                    )
                                  : const SizedBox.shrink())
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

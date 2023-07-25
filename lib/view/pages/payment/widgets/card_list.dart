import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/payment/payment_provider.dart';
import '../../../../controller/service/app_helper.dart';
import '../../../../controller/service/card_utils.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';



class CardList extends ConsumerWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(paymentProvider);
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 24),
        shrinkWrap: true,
        itemCount: state.cardList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: REdgeInsets.only(bottom: 18),
            child: Container(
              padding: REdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: GMedicalStyle.white,
                boxShadow: GMedicalStyle.boxShadow,
              ),
              child: Row(
                children: [
                  CustomImage(
                    url: AppHelper.getCardTypeImage(
                        CardUtils.getCardTypeFrmNumber(
                            state.cardList[index].number ?? "")),
                    height: 45,
                    width: 45,
                    boxFit: BoxFit.contain,
                  ),
                  16.horizontalSpace,
                  Text(
                    " •••• •••• •••• ",
                    style: GMedicalStyle.urbanistSemiBold(size: 28),
                  ),
                  Text(
                    (state.cardList[index].number?.length ?? 0) > 16
                        ? state.cardList[index].number?.substring(15) ?? " "
                        : "0000",
                    style: GMedicalStyle.urbanistSemiBold(),
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text("Connected")),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../controller/shop/shop_provider.dart';
import '../../../companents/custom/store_horizontal.dart';
import '../../../companents/style.dart';


class HospitalList extends ConsumerWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(shopProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text("Top Hospitals",
                  style: GMedicalStyle.urbanistSemiBold(size: 18)),
              const Spacer(),
              TextButton(
                onPressed: null,
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(GMedicalStyle.blue),
                  textStyle: MaterialStateProperty.all(
                      GMedicalStyle.urbanistSemiBold(size: 16)),
                ),
                child: const Text("See all"),
              )
            ],
          ),
        ),
        8.verticalSpace,
        SizedBox(
          height: 190.r,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 12),
              scrollDirection: Axis.horizontal,
              itemCount: state.shops.length,
              itemBuilder: (context, index) {
                return StoreHorizontal(
                  hospital: state.shops[index],
                  onLike: () {
                    ref
                        .read(shopProvider.notifier)
                        .changeShopLike(state.shops[index].id);
                  },
                  isLike: state.shopLikes
                      .contains(state.shops[index].id.toString()),
                );
              }),
        ),
        12.verticalSpace,
      ],
    );
  }
}

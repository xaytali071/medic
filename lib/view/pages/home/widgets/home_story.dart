// ignore_for_file: deprecated_member_use

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../controller/home/home_provider.dart';
import '../../../companents/style.dart';

class HomeStory extends ConsumerWidget {
  const HomeStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    return SizedBox(
      height: 110.r,
      child: ListView.builder(
          // physics: const BouncingScrollPhysics(),
          itemCount: state.storyList.length,
          padding: REdgeInsets.only(left: 24),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16.r),
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: GMedicalStyle.white),
                  child: Center(
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GMedicalStyle.colorsList[index%3].withOpacity(0.3)
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                             state.storyList[index].img ?? "",
                            color: GMedicalStyle.colorsList[index%3],
                            height: 24,
                            width: 24),
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Text(
                  state.storyList[index].title ?? '',
                  style: GMedicalStyle.urbanistSemiBold(
                      size: 12, color: GMedicalStyle.grey),
                )
              ],
            );
          }),
    );
  }
}

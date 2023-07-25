// ignore_for_file: deprecated_member_use

import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:medic/view/companents/app_assets.dart';

import '../../../../controller/settings/setting_provider.dart';
import '../../../companents/custom/buttons/custom_outline_button.dart';
import '../../../companents/custom/custom_text_form_field.dart';
import '../../../companents/style.dart';


class FaqItem extends ConsumerWidget {
  const FaqItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(settingProvider);
    final notifier = ref.read(settingProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        children: [
          18.verticalSpace,
          SizedBox(
            height: 40.r,
            child: ListView.builder(
                padding: REdgeInsets.symmetric(horizontal: 24),
                itemCount: state.tabList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomOutlineButton(
                    title: state.tabList[index],
                    isActive: index == 0 ? true : false,
                  );
                }),
          ),
          18.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: CustomTextField(
              hintText: "Search",
              onChanged: notifier.changeFaqSearch,
              prefixIcon: Padding(
                padding: REdgeInsets.only(left: 12, right: 6),
                child: Icon(
                  FlutterRemix.search_line,
                  size: 20.r,
                ),
              ),
              suffixIcon: Padding(
                  padding: REdgeInsets.all(14),
                  child: SvgPicture.asset(
                    Assets.svgFilter,
                    height: 20.r,
                    width: 20.r,
                    color: GMedicalStyle.primary,
                  )),
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 24),
              itemCount: state.faqs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: REdgeInsets.only(bottom: 18),
                  child: Container(
                    padding:
                        REdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: GMedicalStyle.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: GMedicalStyle.boxShadow,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.faqs[index].title ?? "",
                                style: GMedicalStyle.urbanistSemiBold(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                                splashRadius: 28.r,
                                onPressed: () =>
                                    notifier.changeSelectFaq(index),
                                icon: SvgPicture.asset(
                                  Assets.svgArrowDown2,
                                  color: GMedicalStyle.primary,
                                ))
                          ],
                        ),
                        (state.selectFaq == index)
                            ? Column(
                                children: [
                                  16.verticalSpace,
                                  const Divider(),
                                  16.verticalSpace,
                                  Text(
                                    state.faqs[index].desc ?? "",
                                    style:
                                        GMedicalStyle.urbanistMedium(size: 15),
                                  ),
                                  12.verticalSpace,
                                ],
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

// Container(
// height: 500.r,
// padding: REdgeInsets.symmetric(horizontal: 12, vertical: 4),
// decoration: const BoxDecoration(
// color: Style.white,
// ),
// child: ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// padding:
// REdgeInsets.symmetric(horizontal: 24, vertical: 24),
// itemCount: state.faqs.length,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// 12.verticalSpace,
// Text(
// state.faqs[index].title ?? "",
// style: Style.urbanistMedium(size: 16),
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// 6.verticalSpace,
// const Divider(),
// ],
// );
// }),
// )

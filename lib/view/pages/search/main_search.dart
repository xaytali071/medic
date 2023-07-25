// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/product/product_provider.dart';
import '../../companents/custom/buttons/button_effect.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/custom/custom_text_form_field.dart';
import '../../companents/custom/search_item.dart';
import '../../companents/style.dart';

class MainSearchPage extends ConsumerWidget {
  const MainSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            6.verticalSpace,
            Text(
              "Search",
              style: GMedicalStyle.urbanistBold(size: 24),
            ),
            24.verticalSpace,
            SizedBox(
              height: 100.r,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.category.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: 14.r, left: index == 0 ? 14.r : 0.r),
                      child: ButtonsEffect(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () => notifier.changeIndex(index),
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            width: 100.r,
                            height: 100.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: state.indexCategory == index
                                    ? GMedicalStyle.primary
                                    : GMedicalStyle.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  state.category[index].icon ?? "",
                                  color: state.indexCategory == index
                                      ? GMedicalStyle.white
                                      : GMedicalStyle.black,
                                  height: 32.r,
                                ),
                                Text(
                                  state.category[index].title ?? "",
                                  style: GMedicalStyle.urbanistSemiBold(
                                    size: 12,
                                    color: state.indexCategory == index
                                        ? GMedicalStyle.white
                                        : GMedicalStyle.black,
                                  ),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            24.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 32),
              child: CustomTextField(
                radius: 16,
                color: GMedicalStyle.white,
                readOnly: false,
                hintText: "Search",
                suffixIcon: Container(
                  margin: REdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: GMedicalStyle.primary,
                  ),
                  padding: REdgeInsets.only(left: 6, right: 6),
                  child: Icon(
                    FlutterRemix.search_line,
                    size: 20.r,
                    color: GMedicalStyle.white,
                  ),
                ),
              ),
            ),
            32.verticalSpace,
            SizedBox(
              height: 70.r,
              child: ListView.builder(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: REdgeInsets.only(right: 16),
                      child: Stack(
                        children: [
                          Container(
                            padding: REdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: GMedicalStyle.white),
                            ),
                            child: Container(
                              padding: REdgeInsets.all(2),
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: GMedicalStyle.colorsList[index % 3]
                                      .withOpacity(0.3)),
                              child: CustomImage(
                                url: state.products[index].img ?? "",
                                height: 48,
                                width: 48,
                                boxFit: BoxFit.cover,
                                radius: 24,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 16.r,
                              right: 12.r,
                              child: Container(
                                width: 12.r,
                                height: 12.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: GMedicalStyle.selfActive,
                                  border: Border.all(
                                      color: GMedicalStyle.white, width: 2),
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            ),
            24.verticalSpace,
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: REdgeInsets.symmetric(horizontal: 24),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return SearchItem(
                    onLike: () {
                      ref
                          .read(productProvider.notifier)
                          .changeProductLike(state.products[index].id);
                    },
                    isLike: state.productLikes
                        .contains(state.products[index].id.toString()),
                    productData: state.products[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

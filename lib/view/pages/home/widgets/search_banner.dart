import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/main/main_provider.dart';
import '../../../companents/app_assets.dart';
import '../../../companents/custom/custom_text_form_field.dart';
import '../../../companents/style.dart';


class SearchBanner extends StatelessWidget {
  const SearchBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 32.r),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 28.r),
            padding: EdgeInsets.only(left: 20.r, top: 20.r, right: 28.r),
            height: 175.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: GMedicalStyle.white,
            ),
          ),
          Positioned(
            top: 50.r,
            left: 25.r,
            child: SizedBox(
                width: 160.r,
                child: Text(
                  "Lets Find your Specialist",
                  style: GMedicalStyle.urbanistSemiBold(
                    size: 21,
                    color: GMedicalStyle.black,
                  ),
                )),
          ),
          Positioned(
              top: -35.r,
              right: -25.r,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 200.r,
                          width: 200.r,
                          child: Image.asset(Assets.pngSearchBanner)),
                    ],
                  )
                ],
              )),
          Positioned(
            bottom: 30.r,
            left: 0,
            right: 0,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Consumer(builder: (context, ref, child) {
                return CustomTextField(
                  readOnly: true,
                  onTap: () => ref.read(mainProvider.notifier).changeIndex(2),
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: REdgeInsets.only(left: 12, right: 8),
                    child: Icon(
                      FlutterRemix.search_line,
                      size: 24.r,
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../companents/app_assets.dart';
import '../../companents/custom/keyboart_dissimer.dart';
import '../../companents/style.dart';
import 'widgets/contact_item.dart';
import 'widgets/faq_item.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: GMedicalStyle.white,
                  leading: IconButton(
                    splashRadius: 26.r,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: 26.r),
                  ),
                  title: Text(
                    "Help Center",
                    style: GMedicalStyle.urbanistBold(size: 24),
                  ),
                  actions: [
                    IconButton(
                        splashRadius: 28.r,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Assets.svgMoreCircle,
                          color: GMedicalStyle.primary,
                        )),
                    8.horizontalSpace,
                  ],
                  bottom: TabBar(
                    controller: tabController,
                    labelStyle: GMedicalStyle.urbanistSemiBold(size: 16),
                    indicatorColor: GMedicalStyle.primary,
                    indicatorWeight: 3,
                    padding: REdgeInsets.symmetric(horizontal: 24),
                    indicatorPadding: REdgeInsets.symmetric(horizontal: 6),
                    splashBorderRadius: BorderRadius.circular(6),
                    unselectedLabelColor: GMedicalStyle.greyscale500,
                    labelColor: GMedicalStyle.primary,
                    tabs: const [
                      Tab(text: "FAQ"),
                      Tab(text: "Contact us"),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                FaqItem(),
                ContactItem(),
              ],
            )),
      ),
    );
  }
}

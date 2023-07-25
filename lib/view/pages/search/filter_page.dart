import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../controller/filter/filter_provider.dart';
import '../../companents/style.dart';
import 'widgets/filter_item.dart';


class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(filterProvider.notifier).getFilters();
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: GMedicalStyle.white,
                leading: IconButton(
                  splashRadius: 26.r,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 26.r),
                ),
                title: Text(
                  "Filter",
                  style: GMedicalStyle.urbanistBold(size: 24),
                ),
                bottom: TabBar(
                  controller: tabController,
                  labelStyle: GMedicalStyle.urbanistSemiBold(size: 16),
                  indicatorColor: GMedicalStyle.primary,
                  indicatorWeight: 3,
                  isScrollable: true,
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  indicatorPadding: REdgeInsets.symmetric(horizontal: 6),
                  splashBorderRadius: BorderRadius.circular(6),
                  unselectedLabelColor: GMedicalStyle.greyscale500,
                  labelColor: GMedicalStyle.primary,
                  tabs: const [
                    Tab(text: "Sort by"),
                    Tab(text: "Store"),
                    Tab(text: "Delivery Fee"),
                    Tab(text: "Mode"),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: const [
              FilterItem(),
              FilterItem(),
              FilterItem(),
              FilterItem(),
            ],
          )),
    );
  }
}

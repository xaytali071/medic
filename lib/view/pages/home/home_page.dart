import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:medic/view/pages/home/widgets/doctors_list.dart';
import 'package:medic/view/pages/home/widgets/search_banner.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/hospital_list.dart';
import 'widgets/home_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const HomeAppBar(),
          12.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  16.verticalSpace,
                  const SearchBanner(),
                  36.verticalSpace,
                  const HomeStory(),
                  24.verticalSpace,
                  const HospitalList(),
                  const DoctorsList(),
                  72.verticalSpace,
                  MediaQuery.paddingOf(context).bottom.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

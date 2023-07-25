// ignore_for_file: deprecated_member_use

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../../../controller/address/address_provider.dart';
import '../../../controller/cart/cart_provider.dart';
import '../../../controller/home/home_provider.dart';
import '../../../controller/main/main_provider.dart';
import '../../../controller/product/product_provider.dart';
import '../../../controller/settings/setting_provider.dart';
import '../../../controller/shop/shop_provider.dart';
import '../../companents/app_assets.dart';
import '../../companents/style.dart';
import '../home/home_page.dart';
import '../message/message_page.dart';
import '../profile/profile_page.dart';
import '../search/main_search.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(shopProvider.notifier).init();
      ref.read(homeProvider.notifier).initial();
      ref.read(productProvider.notifier).initial(ref.watch(shopProvider).shops);
      ref.read(settingProvider.notifier).initial();
      ref.read(addressProvider.notifier).initial();
      ref.read(cartProvider.notifier).initial();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ProsteIndexedStack(
        index: state.selectIndex,
        children: [
          IndexedStackChild(child: const HomePage()),
          IndexedStackChild(child: const MessagePage()),
          IndexedStackChild(child: const MainSearchPage()),
          IndexedStackChild(child: const ProfilePage()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        snakeShape: SnakeShape.circle,
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        snakeViewColor: GMedicalStyle.primary,
        selectedItemColor: GMedicalStyle.white,
        unselectedItemColor: GMedicalStyle.greyscale800,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: state.selectIndex,
        onTap: (s) => ref.read(mainProvider.notifier).changeIndex(s),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 24.r,
                Assets.svgHomeOutline,
                color: state.selectIndex == 0
                    ? GMedicalStyle.white
                    : GMedicalStyle.greyscale800,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svgMessage,
                height: 24.r,
                color: state.selectIndex == 1
                    ? GMedicalStyle.white
                    : GMedicalStyle.greyscale800,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 24.r,
                color: state.selectIndex == 2
                    ? GMedicalStyle.white
                    : GMedicalStyle.greyscale800,
                Assets.svgSearch,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              height: 24.r,
              color: state.selectIndex == 3
                  ? GMedicalStyle.white
                  : GMedicalStyle.greyscale800,
              Assets.svgProfile,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

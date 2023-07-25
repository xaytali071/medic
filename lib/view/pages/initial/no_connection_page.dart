import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../companents/style.dart';
import '../../medic_route.dart';


class NoConnectionPage extends ConsumerWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: GMedicalStyle.white,
      body: Column(
        children: [
          200.verticalSpace,
          Icon(
            FlutterRemix.wifi_off_fill,
            size: 120.r,
            color: GMedicalStyle.black,
          ),
          20.verticalSpace,
          Text(
            "NoConnection",
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: GMedicalStyle.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => GMedicalRoute.goSplash(context),
            child: const Icon(
              FlutterRemix.restart_fill,
              color: GMedicalStyle.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

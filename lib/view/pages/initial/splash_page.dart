// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/local_storeage.dart';
import '../../companents/app_assets.dart';
import '../../medic_route.dart';

class GMedicalSplashPage extends ConsumerStatefulWidget {
  const GMedicalSplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GMedicalSplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<GMedicalSplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await GMedicalStorage.init();
      GMedicalStorage.getUser() == null
          ? GMedicalRoute.goBoarding(context)
          : GMedicalRoute.goMain(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.pngGcartSplash, fit: BoxFit.cover);
  }
}

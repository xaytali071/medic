import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../controller/local_storeage.dart';
import '../../../companents/app_assets.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';
import '../../../medic_route.dart';

class HomeAppBar extends StatelessWidget {
  final bool isCart;

  const HomeAppBar({Key? key, this.isCart = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          16.horizontalSpace,
          Expanded(
            child: GMedicalStorage.getUser() == null
                ? Row(
                    children: [
                      TextButton(
                        onPressed: () => GMedicalRoute.goSplash(context),
                        child: const Text("Sign in or Sign up"),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "👋 Good Morning!",
                        style: GMedicalStyle.urbanistRegular(
                          size: 16,
                          color: GMedicalStyle.greyscale600,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          GMedicalStorage.getUser()?.firstName ?? "",
                          style: GMedicalStyle.urbanistSemiBold(size: 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: GMedicalStyle.avatar,
              border: Border.all(color: GMedicalStyle.avatar, width: 2),
            ),
            child: GMedicalStorage.getUser()?.img?.isEmpty ?? true
                ? Image.asset(
                    Assets.pngNoAvatar,
                    height: 50,
                    width: 50,
                  )
                : CustomImage(
                    url: GMedicalStorage.getUser()?.img ?? "",
                    height: 50,
                    width: 50,
                    radius: 100,
                  ),
          ),
        ],
      ),
    );
  }
}

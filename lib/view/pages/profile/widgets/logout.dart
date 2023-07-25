import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/local_storeage.dart';
import 'package:medic/controller/main/main_provider.dart';
import 'package:medic/view/companents/custom/buttons/coniform_button.dart';
import 'package:medic/view/companents/custom/helper/modal_drag.dart';
import 'package:medic/view/companents/custom/helper/modal_wrap.dart';
import 'package:medic/view/companents/style.dart';
import 'package:medic/view/medic_route.dart';



class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalDrag(),
          6.verticalSpace,
          Text(
            "Logout",
            style: GMedicalStyle.urbanistBold(color: GMedicalStyle.error, size: 24),
          ),
          12.verticalSpace,
          Divider(
            color: GMedicalStyle.greyscale200,
            thickness: 1.5.r,
          ),
          16.verticalSpace,
          Text(
            "Are you sure you want to log out?",
            style: GMedicalStyle.urbanistSemiBold(color: GMedicalStyle.greyscale800, size: 20),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 184.r,
                child: ConfirmButton(
                  onTap: () => Navigator.pop(context),
                  isLoading: false,
                  title: "Cancel",
                  isActive: false,
                ),
              ),
              6.horizontalSpace,
              Consumer(
                builder: (context,ref,child) {
                  return SizedBox(
                    width: 184.r,
                    child: ConfirmButton(
                      isBlue: true,
                      onTap: () {
                        GMedicalStorage.deleteUser();
                        ref.read(mainProvider.notifier).changeIndex(0);
                        GMedicalRoute.goBoarding(context);
                      },
                      isLoading: false,
                      title: "Yes, Logout",
                    ),
                  );
                }
              ),
            ],
          ),
          28.verticalSpace,
        ],
      ),
    );
  }
}

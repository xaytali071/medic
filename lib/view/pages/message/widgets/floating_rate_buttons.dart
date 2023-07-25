import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/local_storeage.dart';
import '../../../companents/custom/buttons/coniform_button.dart';
import '../../../companents/style.dart';
import '../../../medic_route.dart';


class ConfirmButtons extends StatelessWidget {
  const ConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
              child: ConfirmButton(
            color: GMedicalStyle.secondary200,
            onTap: () {
              GMedicalStorage.clearCart();
              GMedicalRoute.goMain(context);
            },
            title: 'Cancel',
            isActive: false,
          )),
          12.horizontalSpace,
          Expanded(
              child: ConfirmButton(
                isBlue: true,
                  onTap: () {
                    GMedicalStorage.clearCart();
                    GMedicalRoute.goMain(context);
                  },
                  title: 'Submit'))
        ],
      ),
    );
  }
}

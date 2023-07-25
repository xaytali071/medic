import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../../model/models/notification_data.dart';
import '../../../companents/style.dart';

class NotificationItem extends StatelessWidget {
  final NotificationData notificationData;

  const NotificationItem({Key? key, required this.notificationData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: REdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notificationData.status == "alert"
                    ? GMedicalStyle.alert.withOpacity(0.2)
                    : notificationData.status == "info"
                        ? GMedicalStyle.info.withOpacity(0.2)
                        : notificationData.status == "cancel"
                            ? GMedicalStyle.error.withOpacity(0.2)
                            : GMedicalStyle.primary.withOpacity(0.2),
              ),
              child: SvgPicture.asset(
                notificationData.icon ?? "",
                height: 28.r,
                width: 28.r,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationData.title ?? "",
                    style: GMedicalStyle.urbanistSemiBold(size: 18),
                  ),
                  Text(
                    notificationData.time ?? "",
                    style: GMedicalStyle.urbanistMedium(
                      size: 14,
                      color: GMedicalStyle.greyscale500,
                    ),
                  ),
                ],
              ),
            ),
            (notificationData.isNew ?? false)
                ? Container(
                    padding: REdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      color: GMedicalStyle.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "New",
                      style: GMedicalStyle.urbanistSemiBold(
                        color: GMedicalStyle.white,
                        size: 10,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        16.verticalSpace,
        Text(
          notificationData.desc ?? "",
          style: GMedicalStyle.urbanistRegular(size: 14),
        )
      ],
    );
  }
}

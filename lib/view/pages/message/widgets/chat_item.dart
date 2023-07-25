import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../model/models/chat_data.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';


class ChatItem extends StatelessWidget {
  final ChatData chatData;

  const ChatItem({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    if (chatData.isUser ?? true) {
      return Padding(
        padding: REdgeInsets.only(left: 80, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 200.w, // Set the maximum width here
              ),
              padding: REdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: chatData.img != null? GMedicalStyle.transparent: GMedicalStyle.secondary,
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (chatData.img != null)
                    CustomImage(
                      url: chatData.img,
                      height: 140,
                      width: 140,
                    ),
                  if (chatData.title != null)
                  Expanded(
                    child: Text(
                      chatData.title ?? "",
                      style: GMedicalStyle.urbanistMedium(
                        size: 18,
                        color: GMedicalStyle.white,
                      ),
                    ),
                  ),              
                ],
              ),
            ),
            14.verticalSpace,
            Text(
              DateFormat("hh:mm a").format(
                chatData.date ?? DateTime.now(),
              ),
              style: GMedicalStyle.urbanistRegular(
                size: 14,
                color: chatData.img != null? GMedicalStyle.greyscale500: GMedicalStyle.grey,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: REdgeInsets.only(right: 80, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 200.w,
              ),
              padding: REdgeInsets.symmetric(horizontal: 30, vertical: 16),
              decoration: BoxDecoration(
                color:
                    chatData.img != null ? GMedicalStyle.transparent : GMedicalStyle.infoSelf,
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,

                children: [
                  if (chatData.img != null)
                    CustomImage(
                      url: chatData.img,
                      height: 140,
                      width: 140,
                    ),
                  if (chatData.title != null)
                    Expanded(
                      child: Text(
                        chatData.title ?? "",
                        style: GMedicalStyle.urbanistMedium(
                          size: 18,
                          color: GMedicalStyle.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            14.verticalSpace,
            Text(
              DateFormat("hh:mm a").format(
                chatData.date ?? DateTime.now(),
              ),
              style: GMedicalStyle.urbanistRegular(
                size: 12,
                color:
                chatData.img != null ? GMedicalStyle.greyscale500 : GMedicalStyle.grey,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      );
    }
  }
}

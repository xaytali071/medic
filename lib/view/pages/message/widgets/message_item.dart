import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/models/message_data.dart';
import '../../../companents/custom/buttons/custom_network_image.dart';
import '../../../companents/style.dart';


class MessageItem extends StatelessWidget {
  final MessageData? messageData;

  const MessageItem({super.key, required this.messageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 16),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GMedicalStyle.white,
        boxShadow: const [
          BoxShadow(
            color: GMedicalStyle.greyscale50,
            offset: Offset(0, 4),
            blurRadius: 60,
          ),
        ],
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CustomImage(
                url: messageData?.doctors?.img,
                height: 70,
                width: 70,
                radius: 20,
              ),
            ],
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messageData?.doctors?.name ?? "",
                  style: GMedicalStyle.urbanistSemiBold(size: 18),
                  maxLines: 1,
                ),
                12.verticalSpace,
                Row(
                  children: [
                    if (messageData?.chats?.first.title != null)
                      Expanded(
                        child: Text(
                          messageData?.chats?.first.title ?? "",
                          style: GMedicalStyle.urbanistMedium(
                            size: 14,
                            color: GMedicalStyle.greyscale700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (messageData?.chats?.first.img != null)
                      Expanded(
                        child: Row(
                          children: [
                            CustomImage(
                              url: messageData?.chats?.first.img,
                              height: 30,
                              width: 30,
                              radius: 8,
                            ),
                          ],
                        ),
                      ),
                    12.horizontalSpace,
                    Text(
                      DateFormat("hh:mm a").format(
                        messageData?.chats?.first.date ?? DateTime.now(),
                      ),
                      style: GMedicalStyle.urbanistMedium(
                        size: 14,
                        color: GMedicalStyle.greyscale700,
                      ),
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

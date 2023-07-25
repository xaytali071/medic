import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../controller/chat/chat_provider.dart';
import '../../../model/models/chat_data.dart';
import '../../companents/app_assets.dart';
import '../../companents/custom/buttons/button_effect.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/custom/custom_text_form_field.dart';
import '../../companents/style.dart';
import '../../medic_route.dart';
import 'widgets/chat_item.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () => GMedicalRoute.goReview(context),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        FlutterRemix.arrow_left_s_line,
                        color: GMedicalStyle.grey,
                      )),
                  12.horizontalSpace,
                  CustomImage(
                    url: state.selectDoc?.img,
                    height: 46.h,
                    width: 46.w,
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.selectDoc?.name ?? "",
                        style: GMedicalStyle.urbanistMedium(
                          size: 18,
                          color: GMedicalStyle.black,
                        ),),
                      Text(state.selectDoc?.job ?? "",
                        style: GMedicalStyle.urbanistMedium(
                          size: 10,
                          color: GMedicalStyle.grey,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: REdgeInsets.symmetric(horizontal: 18),
                    reverse: true,
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      return ChatItem(
                        chatData: state.chats[index],
                      );
                    }))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                MediaQuery.of(context).padding.bottom +
                12.r,
            left: 24.r,
            right: 24.r),
        child: CustomTextField(
          controller: controller,
          hintText: "Type a message ...",
          onEditingComplete: () {
            notifier.addMessage(
              ChatData(
                title: controller.text,
                date: DateTime.now(),
                isUser: true,
              ),
            );
            controller.clear();
          },
          suffixIcon: IconButton(
            onPressed: () {
              notifier.addMessage(
                ChatData(
                  title: controller.text,
                  date: DateTime.now(),
                  isUser: true,
                ),
              );
              controller.clear();
            },
            icon: Icon(
              FlutterRemix.send_plane_fill,
              size: 24.r,
            ),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              12.horizontalSpace,
              ButtonsEffect(
                child: GestureDetector(
                  onTap: () => notifier.getImageGallery(),
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      FlutterRemix.attachment_2,
                      size: 24.r,
                    ),
                  ),
                ),
              ),
              ButtonsEffect(
                child: GestureDetector(
                  onTap: () => notifier.getImageCamera(),
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 6),
                    child: SvgPicture.asset(
                      Assets.svgCamera,
                      height: 24.r,
                      width: 24.r,
                    ),
                  ),
                ),
              ),
              6.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

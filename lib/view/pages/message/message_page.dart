import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter/material.dart';

import '../../../controller/chat/chat_provider.dart';
import '../../../controller/local_storeage.dart';
import '../../../controller/product/product_provider.dart';
import '../../companents/style.dart';
import '../../medic_route.dart';
import 'widgets/message_item.dart';

class MessagePage extends ConsumerStatefulWidget {
  const MessagePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends ConsumerState<MessagePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatProvider.notifier).getMessage(ref.watch(productProvider).products);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    return GMedicalStorage.getUser() == null
        ? Center(
            child: TextButton(
              onPressed: () => GMedicalRoute.goSplash(context),
              child: const Text("Sign in or Sign up"),
            ),
          )
        : SafeArea(
          child: Column(
              children: [
                12.verticalSpace,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Message",
                          style: GMedicalStyle.urbanistBold(size: 24),
                        ),
                      ),
                      IconButton(
                          splashRadius: 28.r,
                          onPressed: () {
                            GMedicalRoute.goToShopsList(context);
                          },
                          icon: Icon(
                            FlutterRemix.search_line,
                            size: 28.r,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          REdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      itemCount:
                          state.messages.isEmpty ? 0 : state.messages.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            ref
                                .read(chatProvider.notifier)
                                .selectShop(state.messages[index].doctors);
                            GMedicalRoute.goChat(context);
                          },
                          child: MessageItem(messageData: state.messages[index]),
                        );
                      }),
                ),
              ],
            ),
        );
  }
}

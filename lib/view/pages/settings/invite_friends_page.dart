import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/settings/setting_provider.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/custom/buttons/mini_button.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../companents/style.dart';


class InviteFriendsPage extends ConsumerWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(settingProvider);
    final notifier = ref.read(settingProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResponsiveAppBar(title: "Invite Friends"),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  itemCount: state.friends.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: REdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          CustomImage(
                            url: state.friends[index].avatar,
                            height: 60,
                            width: 60,
                            radius: 100,
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.friends[index].firstName ??
                                      " "} ${state.friends[index].lastName ??
                                      " "}",
                                  style: GMedicalStyle.urbanistSemiBold(),
                                ),
                                Text(
                                  "+1-202-555-0136",
                                  style: GMedicalStyle.urbanistMedium(
                                      size: 14, color: GMedicalStyle.greyscale700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80.r,
                            child: MiniButton(
                              onTap: () => notifier.changeInvite(index),
                              isActive: !(state.friends[index].invite ?? false),
                              title: (state.friends[index].invite ?? false)
                                  ? 'Invited'
                                  : 'Invite',
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

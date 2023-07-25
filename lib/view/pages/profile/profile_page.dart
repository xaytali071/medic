import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/local_storeage.dart';
import 'package:medic/controller/service/app_helper.dart';
import 'package:medic/view/companents/app_assets.dart';
import 'package:medic/view/companents/custom/buttons/custom_network_image.dart';
import 'package:medic/view/companents/style.dart';
import 'package:medic/view/medic_route.dart';
import 'widgets/logout.dart';
import 'widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = GMedicalStorage.getUser();
    return user == null
        ? Center(
            child: TextButton(
              onPressed: () => GMedicalRoute.goSplash(context),
              child: const Text("Sign in or Sign up"),
            ),
          )
        : Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                Positioned(
                  top: -165.r,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 142.r,
                      height: 380.r,
                      padding: REdgeInsets.all(24),
                      decoration: ShapeDecoration(
                        color: GMedicalStyle.primary.withOpacity(0.04),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(71),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Profile",
                            style: GMedicalStyle.urbanistSemiBold(size: 20),
                          ),
                          12.verticalSpace,
                          CustomImage(
                            url: user.img,
                            height: 80,
                            width: 80,
                            radius: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    220.verticalSpace,
                    Text(
                      "${user.firstName ?? ""} ${user.lastName ?? ""}",
                      style: GMedicalStyle.urbanistSemiBold(size: 16),
                    ),
                    user.phoneNumber == null
                        ? const SizedBox.shrink()
                        : Text(
                            "+${user.phoneNumber?.countryCode ?? ""} ${user.phoneNumber?.getFormattedNsn(isoCode: user.phoneNumber?.isoCode) ?? ""}",
                            style: GMedicalStyle.urbanistMedium(
                                color: GMedicalStyle.greyscale800),
                          ),
                    24.verticalSpace,
                    Divider(
                      color: GMedicalStyle.greyscale200,
                      height: 2.r,
                      thickness: 1,
                    ),
                    Expanded(
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 12.r,
                        mainAxisSpacing: 16.r,
                        crossAxisCount: 2,
                        mainAxisExtent: 88.r
                      ),
                      children: [
                        ProfileItem(
                          icon: Assets.svgHeart,
                          title: 'My Favorite doctors',
                          onTap: () => GMedicalRoute.goFavouriteDoctors(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgPayment,
                          title: 'Payment Methods',
                          onTap: () => GMedicalRoute.goPayment(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgProfile,
                          title: 'Profile',
                          onTap: () => GMedicalRoute.goUpdateProfile(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgLocation,
                          title: 'Address',
                          onTap: () => GMedicalRoute.goAddress(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgNotification,
                          title: 'Notification',
                          onTap: () =>
                              GMedicalRoute.goNotificationSettings(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgHelp,
                          title: 'Help Center',
                          onTap: () => GMedicalRoute.goHelpCenter(context),
                        ),
                        ProfileItem(
                          icon: Assets.svg3user,
                          title: 'Invite Friends',
                          onTap: () => GMedicalRoute.goInviteFriends(context),
                        ),
                        ProfileItem(
                          icon: Assets.svgLogout,
                          title: 'Logout',
                          onTap: () {
                            AppHelper.showCustomModalBottomSheet(
                                paddingTop:
                                    MediaQuery.of(context).size.height / 2,
                                context: context,
                                modal: const Logout());
                          },
                          color: GMedicalStyle.error,
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          );
  }
}

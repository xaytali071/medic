import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medic/view/pages/address/address_page.dart';
import 'package:medic/view/pages/address/select_address_page.dart';
import 'package:medic/view/pages/auth/sign_up_page.dart';
import 'package:medic/view/pages/auth/verification_page.dart';
import 'package:medic/view/pages/home/widgets/story_page.dart';
import 'package:medic/view/pages/hospital/all_products_page.dart';
import 'package:medic/view/pages/hospital/contact_seller_page.dart';
import 'package:medic/view/pages/hospital/favourite_shops_page.dart';
import 'package:medic/view/pages/hospital/reviews_page.dart';
import 'package:medic/view/pages/hospital/shop_page.dart';
import 'package:medic/view/pages/initial/onboarding.dart';
import 'package:medic/view/pages/initial/splash_page.dart';
import 'package:medic/view/pages/main/main_page.dart';
import 'package:medic/view/pages/message/chat_page.dart';
import 'package:medic/view/pages/message/doctor_rate_page.dart';
import 'package:medic/view/pages/message/doctors_list_page.dart';
import 'package:medic/view/pages/notification/notification_page.dart';
import 'package:medic/view/pages/payment/add_card_page.dart';
import 'package:medic/view/pages/payment/payment_page.dart';
import 'package:medic/view/pages/product/product_page.dart';
import 'package:medic/view/pages/profile/fill_profile_page.dart';
import 'package:medic/view/pages/search/filter_page.dart';
import 'package:medic/view/pages/search/search_page.dart';
import 'package:medic/view/pages/settings/help_center_page.dart';
import 'package:medic/view/pages/settings/invite_friends_page.dart';
import 'package:medic/view/pages/settings/notification_settings.dart';

import '../controller/notification/notification_provider.dart';
import '../model/models/product_data.dart';
import '../model/models/shop_data.dart';

abstract class GMedicalRoute {
  GMedicalRoute._();

  static goSplash(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const GMedicalSplashPage(),
        ),
            (route) => false,
      );

  static goBoarding(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const OnBoardingMedicalPage(),
        ),
            (route) => false,
      );

  static goFillProfile(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const FillProfilePage(),
    ),
  );

  static goMain(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
            (route) => false,
      );

  static goSignUp(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const SignUpPage(),
    ),
  );

  static goVerification(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const VerificationPage(),
    ),
  );

  static goUpdateProfile(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const FillProfilePage(
        isUpdate: true,
      ),
    ),
  );

  static goNotification(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => Consumer(builder: (context, ref, child) {
        ref.read(notificationProvider.notifier).getNotifications();
        return const NotificationPage();
      }),
    ),
  );

  static goToShopsList(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const DoctorsListPage(),
    ),
  );

  static goPayment(BuildContext context, [bool isRemember = true]) {
    if (isRemember) {
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const PaymentPage(),
        ),
      );
    } else {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const PaymentPage(),
          ),
              (route) => false);
    }
  }

  static goToShopPage(BuildContext context, {ShopData? hospital}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ShopPage(hospital: hospital),
        ),
      );

  static goToSellerContactPage(BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ContactSellerPage(),
        ),
      );

  static goAddCard(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const AddCardPage(),
    ),
  );

  static goFavouriteDoctors(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const FavouriteDoctorsPage(),
    ),
  );

  static goAddress(BuildContext context, {bool isSave = false}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AddressPage(isSave: isSave),
        ),
      );

  static goNotificationSettings(BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const NotificationSettingsPage(),
        ),
      );

  static goInviteFriends(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const InviteFriendsPage(),
    ),
  );

  static goToProductPage(BuildContext context, {required ProductData doctor}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductPage(doctor: doctor),
        ),
      );

  static goToReviewsPage(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const ReviewsPage(),
    ),
  );

  static goToSeeAllPage(BuildContext context, {required String title}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => SeeAllPage(title),
        ),
      );

  static goHelpCenter(BuildContext context) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const HelpCenterPage(),
    ),
  );

  static goChat(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ChatPage()),
    );
  }

  static goReview(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RateStorePage()),
    );
  }

  static goSearch(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const SearchPage()),
  );

  static goFilter(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const FilterPage()),
  );

  static goSelectAddress(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SelectAddressPage(
        onSave: () => Navigator.pop(context),
      ),
    ),
  );

  static goAddAddress(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SelectAddressPage(
        onSave: () => GMedicalRoute.goMain(context),
      ),
    ),
  );

  static goToHomeStoryPage(
      BuildContext context, {
        required String image,
        required String title,
      }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeStoryPage(image, title),
        ),
      );
}

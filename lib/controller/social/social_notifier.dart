import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/models/shop_data.dart';
import '../../model/models/social.data.dart';
import '../../view/companents/app_assets.dart';
import '../local_storeage.dart';
import 'social_state.dart';

class SocialNotifier extends StateNotifier<SocialState> {
  SocialNotifier() : super(const SocialState());

  initial() async {
    await getShop();
    getSocials();
    getSocialLikes();
  }

  getShop() async {
    final data = await rootBundle.loadString(Assets.cartDataShop);
    List<ShopData> shops = shopDataFromJson(data);
    state = state.copyWith(shops: shops);
  }

  getSocials() async {
    final data = await rootBundle.loadString(Assets.cartDataSocial);
    List<SocialData> socials = socialDataFromJson(data, state.shops);
    state = state.copyWith(socials: socials);
  }

  void changeIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  getSocialLikes() async =>
      state = state.copyWith(socialLikes: await GMedicalStorage.getSocialLikes());

  changeSocialLike(int? id) {
    String value = "${id ?? 0}";

    List<String> list = List.from(state.socialLikes);
    if (state.socialLikes.contains(value)) {
      list.remove(value);

      state = state.copyWith(socialLikes: list);
      GMedicalStorage.removeSocialLikes(value);
    } else {
      list.add(value);
      state = state.copyWith(socialLikes: list);
      GMedicalStorage.setSocialLikes(value);
    }
  }
}

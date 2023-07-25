import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/models/friends_data.dart';
import '../../model/models/shop_data.dart';
import '../../view/companents/app_assets.dart';
import '../local_storeage.dart';
import 'shop_state.dart';

class ShopNotifier extends StateNotifier<ShopState> {
  ShopNotifier() : super(const ShopState());

  init() async {
    await getShop();
    getShopLikes();
    getUsers();
  }

  getShop() async {
    final data = await rootBundle.loadString(Assets.medicalDataShop);
    List<ShopData> shops = shopDataFromJson(data);
    state = state.copyWith(shops: shops);
  }


  getUsers() async {
    final data = await rootBundle.loadString(Assets.cartDataFriends);
    List<FriendsData> friends = friendsDataFromJson(data);
    state = state.copyWith(friends: friends);
  }

  setSelectedIndex({required int index}) {
    state = state.copyWith(selectedIndex: index);
  }

  getShopLikes() async =>
      state = state.copyWith(shopLikes: await GMedicalStorage.getShopLikes());

  changeShopLike(int? id) {
    String value = "${id ?? 0}";

    List<String> list = List.from(state.shopLikes);
    if (state.shopLikes.contains(value)) {
      list.remove(value);

      state = state.copyWith(shopLikes: list);
      GMedicalStorage.removeShopLikes(value);
    } else {
      list.add(value);
      state = state.copyWith(shopLikes: list);
      GMedicalStorage.setShopLikes(value);
    }
  }

}

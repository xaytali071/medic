import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/models/cart_data.dart';
import '../../model/models/category_data.dart';
import '../../model/models/product_data.dart';
import '../../model/models/shop_data.dart';
import '../../view/companents/app_assets.dart';
import '../local_storeage.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(const ProductState());

  initial(List<ShopData> shops) async {
   await getProducts(shops);
    getProductLikes();
    getDisease();
  }

  getProductLikes() async => state =
      state.copyWith(productLikes: await GMedicalStorage.getProductLikes());

  changeProductLike(int? id) {
    String value = "${id ?? 0}";
    List<String> list = List.from(state.productLikes);
    if (state.productLikes.contains(value)) {
      list.remove(value);
      state = state.copyWith(productLikes: list);
      GMedicalStorage.removeProductLikes(value);
    } else {
      list.add(value);
      state = state.copyWith(productLikes: list);
      GMedicalStorage.setProductLikes(value);
    }
  }

  getProducts(List<ShopData> shops) async {
    final data = await rootBundle.loadString(Assets.medicalDataProducts);
    List<ProductData> products = productDataFromJson(data, shops);
    state = state.copyWith(products: products);
  }

  getDisease() async {
    final data = await rootBundle.loadString(Assets.medicalDataCategory);
    List<CategoryData> category = categoryDataFromJson(data);
    state = state.copyWith(category: category);
  }

  changeQuery(String query) {
    if (query.isNotEmpty) {
      List<ProductData> list = [];
      for (int i = 0; i < state.products.length; i++) {
        if (state.products[i].name?.contains(query) ?? false) {
          list.add(state.products[i]);
        }
      }
      state = state.copyWith(searchProducts: list);
    } else {
      state = state.copyWith(searchProducts: []);
    }
    state = state.copyWith(query: query);
  }

  increaseCount(CartlData cart, int index) {
    int sum;
    state = state.copyWith(count: state.count + 1);
    sum = (state.products[index].price)! * (state.count);

    state = state.copyWith(totalPrice: sum);
  }

  decreaseCount(CartlData cart, int index) {
    int sum;
    if (state.count > 0) {
      state = state.copyWith(count: state.count + -1);
      sum = state.totalPrice - state.products[index].price!.toInt();
      state = state.copyWith(totalPrice: sum);
    }
  }

  getCounts(int productId) {
    CartlData? cart = GMedicalStorage.getSingleCount(productId);
    state = state.copyWith(
        count: cart?.count ?? 0, totalPrice: cart?.totalCount ?? 0);
  }

  addToCart(int index) {
    GMedicalStorage.increaseCount(CartlData(
        product: state.products[index],
        count: state.count,
        productId: state.products[index].id,
        totalCount: state.totalPrice));
  }

  update() {
    state = state.copyWith(products: state.products);
  }

  changeFilter(int index) {
    List<bool> list = List.from(state.selectFilters);
    list[index] = !list[index];
    state = state.copyWith(selectFilters: list);
  }

  changeIndex(int index){
    state = state.copyWith(indexCategory: index);
  }
}

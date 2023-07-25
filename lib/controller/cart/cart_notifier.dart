import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/models/cart_data.dart';
import '../../model/models/product_data.dart';
import '../local_storeage.dart';
import 'cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  initial() {
    getCount();
  }

  getCarts(List<ProductData> products) {
    List<CartlData> list = GMedicalStorage.getCount(product: products);
    state = state.copyWith(cartList: list);
    getTotalPrice(products);
    getCount();
  }

  getTotalPrice(List<ProductData> products) {
    int totalPrice = 0;
    GMedicalStorage.getCount().forEach((element) {
      int elementTotalCount = element.totalCount ?? 0;
      int elementCount = element.count ?? 0;
      int elementPrice = elementTotalCount * elementCount;
      totalPrice += elementPrice;
    });
    state = state.copyWith(totalPrice: totalPrice);
  }

  getCount() {
    state = state.copyWith(isEmpty: GMedicalStorage.getCount().isEmpty);
  }
}

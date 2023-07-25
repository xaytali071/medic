import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_storeage.dart';
import 'payment_state.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier() : super(const PaymentState());

  initial() {
    getCards();
  }

  getCards() {
    state = state.copyWith(cardList: GMedicalStorage.getCards());
  }

  setSelectedIndex({required int index}) {
    state = state.copyWith(selectedIndex: index);
  }

  setSelectedDiscountsIndex({required int index}) {
    state = state.copyWith(selectedDiscountsIndex: index);
  }
}


import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/models/card_data.dart';
import '../local_storeage.dart';
import '../service/card_utils.dart';
import 'card_state.dart';

class CardNotifier extends StateNotifier<CardState> {
  CardNotifier() : super(const CardState());

  initial() {}

  changeName(String? name) => state = state.copyWith(name: name ?? "");

  changeNumber(String? number) => state = state.copyWith(number: number ?? "");

  changeDate(String? date) => state = state.copyWith(expiryDate: date ?? "");

  changeCvv(String? cvv) => state = state.copyWith(cvv: cvv ?? "");

  setCard(VoidCallback onSuccess) async {
    await GMedicalStorage.setCard(CardData(
        name: state.name,
        number: state.number,
        expiryDate: state.expiryDate,
        cvv: state.cvv,
        type: CardUtils.getCardTypeFrmNumber(state.number).name));
   state= state.copyWith(name: "",number: '',expiryDate: '',cvv: '');
    onSuccess();
  }
}

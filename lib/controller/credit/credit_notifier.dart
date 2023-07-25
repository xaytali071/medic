import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/models/bank_data.dart';
import '../../model/models/transaction_data.dart';
import '../../view/companents/app_assets.dart';
import '../local_storeage.dart';
import 'credit_state.dart';

class CreditNotifier extends StateNotifier<CreditState> {
  CreditNotifier() : super(const CreditState());

  initial() async {
    await getTransaction();
  }

  getTransaction() async {
    final data = await rootBundle.loadString(Assets.cartDataTransactions);
    List<TransactionData> transactions = transactionDataFromJson(data);
    state = state.copyWith(transactions: transactions);
  }



  addBank(BankData bank) async {
    List<BankData> banks = List.from(state.banks);
    banks.add(bank);
    state = state.copyWith(banks: banks);
    GMedicalStorage.setBank(bank);
  }

  changeBank(int selectBank) => state = state.copyWith(selectBank: selectBank);
}

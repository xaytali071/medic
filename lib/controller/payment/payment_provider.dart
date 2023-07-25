import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medic/controller/payment/payment_notifier.dart';
import 'package:medic/controller/payment/payment_state.dart';


final paymentProvider = StateNotifierProvider<PaymentNotifier, PaymentState>(
  (ref) => PaymentNotifier(),
);

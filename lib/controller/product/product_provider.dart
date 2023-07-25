import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_notifier.dart';
import 'product_state.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(),
);

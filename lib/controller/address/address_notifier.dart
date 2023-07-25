import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/models/location_data.dart';
import '../local_storeage.dart';
import 'address_state.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  AddressNotifier() : super(const AddressState());

  initial() {
    getAddress();
  }

  getAddress() async {
    List<LocationData> list = GMedicalStorage.getUser()?.location ?? [];
    state = state.copyWith(addresses: list);
  }

  setAddress(LocationData data) async {
    List<LocationData> list = List.from(state.addresses);
    list.add(data);
    state = state.copyWith(addresses: list);
  }

  changeSelectAddress(int index) {
    state = state.copyWith(selectAddress: index);
  }
}

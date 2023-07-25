import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/address/address_provider.dart';
import '../../companents/custom/buttons/coniform_button.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../medic_route.dart';
import 'widgets/address_item.dart';

class AddressPage extends ConsumerWidget {
  final bool isSave;

  const AddressPage({Key? key, required this.isSave}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(addressProvider);
    final notifier = ref.read(addressProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResponsiveAppBar(title: "Address"),
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: REdgeInsets.symmetric(horizontal: 24),
                      itemCount: state.addresses.length,
                      itemBuilder: (context, index) {
                        return AddressItem(
                          title: state.addresses[index].title ?? "",
                          isActive: state.selectAddress == index,
                          onTap: () {
                            notifier.changeSelectAddress(index);
                          },
                        );
                      }),
                  if (isSave)
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 24),
                      child: ConfirmButton(
                          isActive: false,
                          onTap: () {
                            GMedicalRoute.goSelectAddress(context);
                          },
                          isLoading: false,
                          title: "Add New Address"),
                    )
                ],
              ),
            ),
            56.verticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: ConfirmButton(
          isBlue: true,
            onTap: () {
              if (isSave) {
                Navigator.pop(context);
              } else {
                GMedicalRoute.goSelectAddress(context);
              }
            },
            isLoading: false,
            title: isSave ? "Save" : "Add New Address"),
      ),
    );
  }
}

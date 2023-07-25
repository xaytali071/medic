import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../controller/chat/chat_provider.dart';
import '../../../controller/product/product_provider.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../medic_route.dart';
import '../hospital/widgets/shop_widget.dart';

class DoctorsListPage extends ConsumerWidget {
  const DoctorsListPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final product = ref.watch(productProvider).products;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResponsiveAppBar(title: 'Doctors'),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  itemCount: product.isEmpty ? 0 : product.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(chatProvider.notifier).selectShop(product[index]);
                        GMedicalRoute.goChat(context);
                      },
                      child: DoctorsWidget(shop: product[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

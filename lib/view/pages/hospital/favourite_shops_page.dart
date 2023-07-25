import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/product/product_provider.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../companents/custom/search_item.dart';


class FavouriteDoctorsPage extends ConsumerWidget {
  const FavouriteDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ResponsiveAppBar(
              title: "My Favorite Doctors",
              suffix: IconButton(
                  splashRadius: 26.r,
                  onPressed: () {},
                  icon: const Icon(FlutterRemix.search_2_line)),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  itemCount: state.products.length~/2,
                  itemBuilder: (context, index) {
                    return SearchItem(
                      onLike: () {
                        ref
                            .read(productProvider.notifier)
                            .changeProductLike(state.products[index].id);
                      },
                      isLike: state.productLikes
                          .contains(state.products[index].id.toString()),
                      productData: state.products[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../controller/local_storeage.dart';
import '../../../controller/product/product_provider.dart';
import '../../../controller/shop/shop_provider.dart';
import '../../../model/models/shop_data.dart';
import '../../companents/app_assets.dart';
import '../../companents/custom/animations/scaleup_anomation.dart';
import '../../companents/custom/buttons/button_effect.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/custom/buttons/like_button.dart';
import '../../companents/custom/search_item.dart';
import '../../companents/style.dart';
import '../../medic_route.dart';
import 'widgets/popular_items.dart';
import 'widgets/shop_appbar.dart';
import 'widgets/shop_items.dart';

class ShopPage extends ConsumerWidget {
  final ShopData? hospital;

  const ShopPage({super.key, required this.hospital});

  @override
  @override
  Widget build(BuildContext context, ref) {
    final shopState = ref.watch(shopProvider);
    final productState = ref.watch(productProvider);

    return Scaffold(
      body: shopState.shops.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBox) {
                      return [
                        ShopAppBar(
                            shopName: hospital?.name ?? "",
                            img: hospital?.img ?? '')
                      ];
                    },
                    body: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.verticalSpace,
                          Padding(
                            padding: REdgeInsets.only(left: 24),
                            child: Row(
                              children: [
                                Container(
                                  height: 48.r,
                                  width: 48.r,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: GMedicalStyle.primary, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomImage(
                                    url: hospital?.img,
                                    radius: 24,
                                  ),
                                ),
                                16.horizontalSpace,
                                Expanded(
                                  child: Text(
                                    hospital?.name ?? "",
                                    style: GMedicalStyle.urbanistBold(size: 20),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                LikeButton(
                                    onTap: () {
                                      ref
                                          .read(shopProvider.notifier)
                                          .changeShopLike(hospital?.id);
                                    },
                                    isLike: shopState.shopLikes
                                        .contains(hospital?.id.toString())),
                                12.horizontalSpace,
                              ],
                            ),
                          ),
                          18.verticalSpace,
                          ShopItem(
                            icon: Assets.svgStar,
                            title: '${hospital?.rate}',
                            onTap: () => GMedicalRoute.goToReviewsPage(context),
                            desc: '(${hospital?.rate ?? ''}k reviews)',
                          ),
                          ShopItem(
                            isActive: false,
                            icon: Assets.svgStar,
                            title: '2 Hours',
                            onTap: () {},
                            desc: 'Response time',
                          ),
                          ButtonsEffect(
                            child: ShopItem(
                              isActive: false,
                              icon: Assets.svgLocationPrimary,
                              title:
                                  (hospital?.location?.title?.length ?? 0) > 14
                                      ? hospital?.location?.title
                                              ?.substring(0, 14) ??
                                          ''
                                      : hospital?.location?.title ?? "",
                              onTap: () {},
                              desc: '',
                            ),
                          ),
                          ButtonsEffect(
                            child: ShopItem(
                              icon: Assets.svgMessagePrimary,
                              title: 'Contact Seller',
                              onTap: () =>
                                  GMedicalRoute.goToSellerContactPage(context),
                              desc: '',
                            ),
                          ),
                          24.verticalSpace,
                          Padding(
                            padding: REdgeInsets.only(left: 24),
                            child: Text(
                              'Popular',
                              style: GMedicalStyle.urbanistBold(size: 24),
                            ),
                          ),
                          SizedBox(
                            height: 360.r,
                            child: ListView.builder(
                              padding: REdgeInsets.symmetric(
                                  vertical: 24, horizontal: 24),
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: productState.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ButtonsEffect(
                                  child: GestureDetector(
                                      onTap: () =>
                                          GMedicalRoute.goToProductPage(context,
                                              doctor:
                                                  productState.products[index]),
                                      child: PopularItems(
                                        isOnCart:
                                            GMedicalStorage.getSingleCount(
                                                        productState
                                                                .products[index]
                                                                .id ??
                                                            0)
                                                    ?.productId ==
                                                productState.products[index].id,
                                        isStatus:
                                            productState.products[index].job !=
                                                null,
                                        title:
                                            productState.products[index].name ??
                                                '',
                                        rating:
                                            '${productState.products[index].rate ?? ''}',
                                        price: productState
                                                .products[index].price ??
                                            0,
                                        status:
                                            '${productState.products[index].job}',
                                        img: productState.products[index].img ??
                                            '',
                                        onLike: () {
                                          ref
                                              .read(productProvider.notifier)
                                              .changeProductLike(productState
                                                  .products[index].id);
                                        },
                                        isLike: productState.productLikes
                                            .contains(productState
                                                .products[index].id
                                                .toString()),
                                      )),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                Text(
                                  'Doctors',
                                  style: GMedicalStyle.urbanistBold(size: 24),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () => GMedicalRoute.goToSeeAllPage(
                                      context,
                                      title: 'All Doctors'),
                                  child: Text(
                                    'See All',
                                    style: GMedicalStyle.urbanistBold(
                                        size: 16, color: GMedicalStyle.primary),
                                  ),
                                )
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: REdgeInsets.symmetric(horizontal: 24),
                            shrinkWrap: true,
                            itemCount: productState.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ButtonsEffect(
                                child: GestureDetector(
                                    onTap: () => GMedicalRoute.goToProductPage(
                                        context,
                                        doctor: productState.products[index]),
                                    child: SearchItem(
                                      onLike: () {
                                        ref
                                            .read(productProvider.notifier)
                                            .changeProductLike(productState
                                                .products[index].id);
                                      },
                                      isLike: productState.productLikes
                                          .contains(productState
                                              .products[index].id
                                              .toString()),
                                      productData: productState.products[index],
                                    )),
                              );
                            },
                          ),
                          24.verticalSpace,
                        ],
                      ),
                    )),
                Positioned(
                    top: MediaQuery.of(context).padding.top + 4.r,
                    left: 18.r,
                    right: 24.r,
                    child: Row(
                      children: [
                        ScaleUpAnimation(
                          child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                size: 26.r,
                                color: GMedicalStyle.black,
                              )),
                        ),
                        const Spacer(),
                        ScaleUpAnimation(
                          child: SvgPicture.asset(
                            Assets.svgSend,
                            color: GMedicalStyle.black,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
    );
  }
}

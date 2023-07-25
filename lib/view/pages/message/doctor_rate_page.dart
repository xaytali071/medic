import 'package:animated_rating_bar/animated_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../controller/shop/shop_provider.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/custom/custom_text_form_field.dart';
import '../../companents/custom/keyboart_dissimer.dart';
import '../../companents/style.dart';
import 'widgets/floating_rate_buttons.dart';

class RateStorePage extends StatelessWidget {
  const RateStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    40.verticalSpace,
                    Center(
                      child: CustomImage(
                        url: ref.watch(shopProvider).shops.last.img,
                        height: 200,
                        width: 200,
                        radius: 40,
                      ),
                    ),
                    28.verticalSpace,
                    Text(
                      'How was the delivery of your order from ${ref.watch(shopProvider).shops.last.name}?',
                      style: GMedicalStyle.urbanistSemiBold(size: 26),
                      textAlign: TextAlign.center,
                    ),
                    28.verticalSpace,
                    Text(
                      'Enjoyed the service offer? Rate the store.',
                      style: GMedicalStyle.urbanistRegular(
                          color: GMedicalStyle.greyscale700, size: 18),
                    ),
                    33.verticalSpace,
                    AnimatedRatingBar(
                      activeFillColor: GMedicalStyle.primary,
                      strokeColor: GMedicalStyle.primary,
                      initialRating: 0,
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      animationColor: GMedicalStyle.primary,
                      onRatingUpdate: (rating) {
                        debugPrint(rating.toString());
                      },
                    ),
                    33.verticalSpace,
                    const Divider(
                      color: GMedicalStyle.greyscale400,
                    ),
                    28.verticalSpace,
                    const CustomTextField(
                      isPadding: true,
                      hintText:
                          'Anisha was very helpful and responded in literally mins. I will definitely be back 😍😍',
                    )
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const ConfirmButtons(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic/view/companents/app_assets.dart';
import 'package:medic/view/pages/product/widgets/patients_item.dart';
import 'package:medic/view/pages/product/widgets/rating_item.dart';

import '../../../model/models/product_data.dart';
import '../../companents/custom/animations/scaleup_anomation.dart';
import '../../companents/custom/animations/translateup_animation.dart';
import '../../companents/custom/buttons/coniform_button.dart';
import '../../companents/custom/buttons/custom_network_image.dart';
import '../../companents/style.dart';

class ProductPage extends StatelessWidget {
  final ProductData doctor;

  const ProductPage({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.paddingOf(context).top / 2),
            child: CustomImage(
                url: doctor.img,
                height: 400,
                radius: 0,
                width: double.infinity),
          ),
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
                        )),
                  ),
                  const Spacer(),
                  ScaleUpAnimation(
                    child: SvgPicture.asset(
                      Assets.svgSend,
                      // ignore: deprecated_member_use
                      color: GMedicalStyle.black,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 400.r,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 400,
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                  color: GMedicalStyle.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name ?? '',
                    style: GMedicalStyle.urbanistSemiBold(size: 20),
                  ),
                  Text(
                    doctor.job ?? '',
                    style: GMedicalStyle.urbanistSemiBold(
                      size: 16,
                      color: GMedicalStyle.greyscale700,
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PatientsItem(count: doctor.order),
                        8.horizontalSpace,
                        RatingItem(rating: doctor.rate),
                      ]),
                  24.verticalSpace,
                  const Divider(color: GMedicalStyle.grey),
                  20.verticalSpace,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: GMedicalStyle.secondary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(
                          Icons.access_time_outlined,
                          color: GMedicalStyle.white,
                        ),
                      ),
                      15.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Morning 8 AM - Night 8 PM",
                            style: GMedicalStyle.urbanistSemiBold(size: 16),
                          ),
                          4.verticalSpace,
                          Text(
                            "Meeting Time",
                            style: GMedicalStyle.urbanistMedium(
                              size: 14,
                              color: GMedicalStyle.greyscale800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Expanded(
                    child: Text(
                      doctor.description ?? "",
                      style: GMedicalStyle.urbanistSemiBold(size: 16),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: TranslateUpAnimation(
          child: ConfirmButton(
            isBlue: true,
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Get Appointment',
          ),
        ),
      ),
    );
  }
}
